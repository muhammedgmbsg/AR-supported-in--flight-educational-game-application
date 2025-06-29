// lib/views/ar_core_screen.dart

import 'dart:async';
import 'dart:typed_data';
import 'dart:math';
import 'package:ar_beta/controllers/login_controller.dart';
import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/services/firebaseService.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArCoreScreen extends StatefulWidget {
  const ArCoreScreen({Key? key, required this.cityName}) : super(key: key);
  final String cityName;

  @override
  State<ArCoreScreen> createState() => _ArCoreScreenState();
}

class _ArCoreScreenState extends State<ArCoreScreen> {
  ArCoreController? _arCoreController;
  late List<String> _imagesForCubes;
  final List<int> _selectedIndices = [];
  bool _isProcessing = false;
  int _matchedPairs = 0;
  bool _gameComplete = false;
  bool _timeExpired = false;
  bool _showImages = false;

  // Sayaç ve zaman aşımı için
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _expirationTimer;

  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _prepareImageList();

    // Sayaç başlat
    _stopwatch.start();
    // 120 saniye sonra sürenin dolduğunu işaretle
    _expirationTimer = Timer(const Duration(seconds: 120), () {
      if (!_gameComplete) {
        _stopwatch.stop();
        setState(() => _timeExpired = true);
        _saveScore(0);
      }
    });
  }

  @override
  void dispose() {
    _expirationTimer?.cancel();
    _arCoreController?.dispose();
    super.dispose();
  }

void _prepareImageList() {
  const int photoCount = 8;
  // Ön tanımlı genel assetler (tüm şehirler için)
  final defaultAssets = List.generate(
    photoCount,
    (i) => 'images/photo${i + 1}.jpg',
  );

  // Sadece bu şehirler için cityName bazlı asset kullan
  const specialCities = [
    'istanbul',
    'ankara',
    'izmir',
    'malatya',
    'elazig',
    'adana',
    'diyarbakır',
  ];

  // widget.cityName'i küçültüp listeye bakıyoruz
  final baseAssets = specialCities.contains(widget.cityName.toLowerCase())
      ? List.generate(
          photoCount,
          (i) => 'images/${widget.cityName.toLowerCase()}${i + 1}.jpg',
        )
      : defaultAssets;

  // Eşleştirme oyunu için iki kere ekle ve karıştır
  _imagesForCubes = [...baseAssets, ...baseAssets];

  // Debug: her yol için konsola yazdır
  _imagesForCubes.forEach(debugPrint);

  _imagesForCubes.shuffle(Random());
}


  void _onArCoreViewCreated(ArCoreController controller) {
    _arCoreController = controller;
    controller.onNodeTap = _handleNodeTap;
    _addAllFrontCubes();
  }

  Future<void> _addAllFrontCubes() async {
    const size = 0.25;
    const gap = 0.4;
    // 16 adet; 8 çift
    for (var i = 0; i < 16; i++) {
      await _addCube(i, front: true, size: size, gap: gap);
    }
  }

  Future<void> _addCube(int index,
      {required bool front, required double size, required double gap}) async {
    final path = front ? 'images/question.jpg' : _imagesForCubes[index];
    final bytes = await rootBundle.load(path);
    final tex = bytes.buffer.asUint8List();
    final mat = ArCoreMaterial(
      textureBytes: tex,
      color: Colors.white,
      metallic: 1.0,
      roughness: 1.0,
    );
    final cube = ArCoreCube(
      materials: [mat],
      size: vector64.Vector3(size, size, 0.01),
    );

    final row = index ~/ 4;
    final col = index % 4;
    final x = (col - 1.5) * gap;
    final y = (1.5 - row) * gap;

    final node = ArCoreNode(
      shape: cube,
      name: '${front ? 'front' : 'back'}_$index',
      position: vector64.Vector3(x, y, -1.5),
    );
    await _arCoreController?.addArCoreNode(node);
  }

  void _handleNodeTap(String nodeName) {
    if (_isProcessing || _gameComplete || _timeExpired) return;
    final parts = nodeName.split('_');
    if (parts.length != 2) return;
    final prefix = parts[0];
    final idx = int.tryParse(parts[1]);
    if (idx == null || prefix != 'front') return;
    _flipFrontToBack(idx);
  }

  void _flipFrontToBack(int index) {
    _isProcessing = true;
    _arCoreController?.removeNode(nodeName: 'front_$index');
    _addCube(index, front: false, size: 0.25, gap: 0.4).then((_) {
      _selectedIndices.add(index);
      if (_selectedIndices.length == 2) {
        _checkMatch();
      } else {
        _isProcessing = false;
      }
    });
  }

  void _checkMatch() {
    final i1 = _selectedIndices[0], i2 = _selectedIndices[1];
    final same = _imagesForCubes[i1] == _imagesForCubes[i2];

    Future.delayed(const Duration(seconds: 1), () {
      if (same) {
        _arCoreController?.removeNode(nodeName: 'back_$i1');
        _arCoreController?.removeNode(nodeName: 'back_$i2');
        _matchedPairs++;
      } else {
        _arCoreController?.removeNode(nodeName: 'back_$i1');
        _arCoreController?.removeNode(nodeName: 'back_$i2');
        _addCube(i1, front: true, size: 0.25, gap: 0.4);
        _addCube(i2, front: true, size: 0.25, gap: 0.4);
      }
      _selectedIndices.clear();
      _isProcessing = false;

      if (_matchedPairs == 8) {
        _onGameComplete();
      }
    });
  }

  void _onGameComplete() {
    _expirationTimer?.cancel();
    _stopwatch.stop();

    final elapsed = _stopwatch.elapsed.inSeconds;
    final score = elapsed >= 120
        ? 0
        : (((120 - elapsed) / 120) * 100).round();

    _saveScore(score);

    setState(() => _gameComplete = true);
  }

  Future<void> _saveScore(int score) async {
    try {
      final box = GetStorage();
      final userId = box.read<String>('currentUserId') ?? '';
      await _firebaseService.addArCityScore(
        username: userId,
        cityName: widget.cityName,
        score: score,
      );

      final raw = box.read('arCityScores') ?? <String, dynamic>{};
      final scores = Map<String, int>.from(raw);
      scores[widget.cityName] = score;
      box.write('arCityScores', scores);
    } catch (e) {
      print('Puan kaydedilemedi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: themeController.buttonColor,
        title: Text('${widget.cityName} AR OYUNU',
            style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => _showImages = !_showImages);
            },
            child: Text(
              _showImages ? 'AR Görünümüne Dön' : 'Resimleri Göster',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: _showImages
          // Resimleri listeleme
          ? GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                final path =
                    'images/${widget.cityName.toLowerCase()}${index + 1}.jpg';
                return Image.asset(
                  path,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox()
                );
              },
            )
          // AR görünümü
          : Stack(
              children: [
                ArCoreView(
                  onArCoreViewCreated: _onArCoreViewCreated,
                  enableTapRecognizer: true,
                ),
                if (_gameComplete || _timeExpired)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.black54,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _timeExpired
                                ? 'Süreniz doldu, puanınız 0'
                                : 'Tebrikler!\nPuanınız: ${(((120 - _stopwatch.elapsed.inSeconds) < 0) ? 0 : (((120 - _stopwatch.elapsed.inSeconds) / 120) * 100).round())}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}