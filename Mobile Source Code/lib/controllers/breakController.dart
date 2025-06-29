import 'dart:async';
import 'package:ar_beta/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Uygulama çalışırken 10 dakikada bir zorunlu mola veren, mola süresi 5 dakika olan kontrol sınıfı.
class BreakController extends GetxController {
  static const _sessionDuration = Duration(seconds: 30);
  static const _warningOffset   = Duration(seconds: 5);
  static const _breakDuration   = Duration(seconds: 20);

  final box = GetStorage();
  Timer? _warningTimer;
  Timer? _breakTimer;
  Timer? _sessionTimer;

  @override
  void onInit() {
    super.onInit();
    // Oturum veya restore edilmiş molayı başlat
    _startOrRestoreSession();
  }

  @override
  void onReady() {
    super.onReady();
    // Break durumunda restore kontrolü
    _checkRestoreBreak();
  }

  void _startOrRestoreSession() {
    // Eğer molada değilsek yeni oturum timer başlat
    if (box.read<int>('breakStart') == null) {
      _cancelTimers();
      _scheduleSession(_sessionDuration);
    }
  }

  void _checkRestoreBreak() {
    final millis = box.read<int>('breakStart');
    if (millis != null) {
      final start = DateTime.fromMillisecondsSinceEpoch(millis);
      final elapsed = DateTime.now().difference(start);
      if (elapsed < _breakDuration) {
        _enterBreak(fromStorage: true);
      } else {
        // Mola süresi geçmişse kaydı temizle ve yeni oturum başlat
        box.remove('breakStart');
        _startOrRestoreSession();
      }
    }
  }

  /// Oturum için uyarı ve mola timerlarını ayarlar
  void _scheduleSession(Duration remaining) {
    // 30s önce uyarı için
    final warningAfter = remaining - _warningOffset;
    if (warningAfter > Duration.zero) {
      _warningTimer = Timer(warningAfter, _showWarning);
    } else {
      // Zaman geçmişse hemen uyarı
      Future.delayed(Duration.zero, _showWarning);
    }
    // Mola başlangıcı için
    _sessionTimer = Timer(remaining, () => _enterBreak());
  }

  /// Uyarı dialogunu gösterir
  void _showWarning() {
    Get.dialog(
      AlertDialog(
        title: const Text('Uyarı'),
        content: const Text(
          '30 saniye sonra mola durumuna geçilecek.\nLütfen ilerlemenizi kaydedin.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tamam'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  /// Mola ekranına geçer
  void _enterBreak({bool fromStorage = false}) {
    // Kaydetmediysek mola başlangıcını sakla
    if (!fromStorage) {
      box.write('breakStart', DateTime.now().millisecondsSinceEpoch);
    }
    // Dialog varsa kapat
    if (Get.isDialogOpen ?? false) Get.back();
    // BreakScreen'e yönlendir
    Future.delayed(Duration.zero, () {
      Get.off(() => const BreakScreen());
    });

    // Mola süresi tamamlandığında çıkış
    final startMillis = box.read<int>('breakStart')!;
    final start = DateTime.fromMillisecondsSinceEpoch(startMillis);
    final elapsed = DateTime.now().difference(start);
    final remainingBreak = _breakDuration - elapsed;
    _breakTimer = Timer(
      remainingBreak > Duration.zero ? remainingBreak : Duration.zero,
      _exitBreak,
    );
  }

  /// Mola bittiğinde çağrılır
  void _exitBreak() {
    // Mola kaydını temizle
    box.remove('breakStart');
    // BreakScreen'den çık
    Future.delayed(Duration.zero, () {
      Get.offAll(() => const RouteSelectionScreen());
    });
    // Yeni oturum timer'ı başlat
    _startOrRestoreSession();
  }

  /// Var olan tüm timerları iptal eder
  void _cancelTimers() {
    _warningTimer?.cancel();
    _sessionTimer?.cancel();
    _breakTimer?.cancel();
  }

  @override
  void onClose() {
    _cancelTimers();
    super.onClose();
  }
}

/// Zorunlu mola ekranı
class BreakScreen extends StatelessWidget {
  const BreakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.self_improvement, size: 80, color: Colors.blueAccent),
              SizedBox(height: 16),
              Text(
                'Göz Dinlendirme Zamanı!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '5 dakika zorunlu mola',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}