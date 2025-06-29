import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ar_beta/model/awart.dart'; // Award modeli

class TopAwardsWidget extends StatefulWidget {
  final String cityName;
  const TopAwardsWidget({Key? key, required this.cityName}) : super(key: key);

  @override
  State<TopAwardsWidget> createState() => _TopAwardsWidgetState();
}

class _TopAwardsWidgetState extends State<TopAwardsWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  bool _loading = true;
  List<Award> _awards = [];

  @override
  void initState() {
    super.initState();
    _loadAwards();
  }

  Future<void> _loadAwards() async {
    try {
      // Tüm puzzleGameScores dökümanlarını al
      final snapshot = await FirebaseFirestore.instance
          .collectionGroup('puzzleGameScores')
          .get();

      // Belirli cityName ile eşleşen kayıtları filtrele
      final filtered = snapshot.docs.where(
        (doc) => doc.id == widget.cityName,
      );

      // Model listesine dönüştür
      final entries = filtered.map((doc) {
        final score = (doc.data()['score'] as num).toInt();
        final userId = doc.reference.parent.parent!.id;
        return Award(name: userId, score: score);
      }).toList();

      // Puanlara göre azalan sıralayıp en iyi 5'i al
      entries.sort((a, b) => b.score.compareTo(a.score));
      final top5 = entries.length > 5 ? entries.sublist(0, 5) : entries;

      setState(() {
        _awards = top5;
        _loading = false;
      });

      // Eğer veri varsa sayfa döngüsünü başlat
      if (_awards.isNotEmpty) {
        _timer = Timer.periodic(const Duration(seconds: 3), (_) {
          if (_currentPage < _awards.length - 1) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading awards: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_awards.isEmpty) {
      return const Center(
        child: Text(
          'Henüz oyuncular bu oyunu oynamamış!',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      );
    }

    return PageView.builder(
      controller: _pageController,
      itemCount: _awards.length,
      itemBuilder: (context, index) {
        final award = _awards[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events,
              size: 48,
              color: Colors.amber,
            ),
            const SizedBox(height: 8),
            Text(
              '${award.name} - ${award.score} Puan',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}