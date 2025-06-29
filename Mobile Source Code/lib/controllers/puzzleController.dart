import 'dart:async';
import 'dart:math';
import 'package:ar_beta/services/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login_controller.dart';

class PuzzleController extends GetxController {
  // Şehir adı
  final String cityName;

  // Tüm listeler
  final List<String> allKeywords;
  final List<String> allHints;

  // Oyunda kullanılacak alt listeler
  late final List<String> keywords;
  late final List<String> hints;

  // Süre ve skorlar
  final RxInt remainingSeconds    = 90.obs;
  final RxInt solvedScore         = 0.obs;
  final RxInt skipPenalty         = 0.obs;
  final RxInt finalScore          = 0.obs;
  final RxBool gameOver           = false.obs;

  final RxInt currentKeywordIndex = 0.obs;
  final RxString currentUserAnswer= ''.obs;
  final RxInt lettersRevealedCount= 0.obs;
  late RxList<bool> fullyRevealed;

  Timer? timer;
  int skipCount = 0;

  final FirebaseService _firebaseService = FirebaseService();

  PuzzleController({
    required this.cityName,
    required List<String> keywords,
    required List<String> hints,
  })  : allKeywords = keywords,
        allHints    = hints {
    // easyMode’a göre alt listeleri seç
    final loginCtrl = Get.find<LoginController>();
    if (loginCtrl.easyMode.value) {
      this.keywords = allKeywords.sublist(allKeywords.length - 3);
      this.hints    = allHints.sublist(allHints.length - 3);
    } else {
      this.keywords = allKeywords.sublist(0, 3);
      this.hints    = allHints.sublist(0, 3);
    }

    fullyRevealed = RxList<bool>.generate(this.keywords.length, (_) => false);
    _startCurrentKeyword();
    _startTimer();
  }



  void _startCurrentKeyword() {
    lettersRevealedCount.value = 0;
    fullyRevealed[currentKeywordIndex.value] = false;

    final raw = keywords[currentKeywordIndex.value];
    final proc = _processedWord(raw);

    // sadece harf sayısı kadar "_" oluştur
    currentUserAnswer.value = '_' * proc.length;
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        endGame();
      }
    });
  }

 
  void revealLetter() {
    final raw = keywords[currentKeywordIndex.value];
    final proc = _processedWord(raw);
    final answerChars = currentUserAnswer.value.split('');

    // boşluksuz kelimenin hangi indekslerinde "_" var
    final hidden = <int>[];
    for (var i = 0; i < proc.length; i++) {
      if (answerChars[i] == '_') hidden.add(i);
    }
    if (hidden.isNotEmpty) {
      final idx = hidden[Random().nextInt(hidden.length)];
      answerChars[idx] = proc[idx];
      currentUserAnswer.value = answerChars.join();
      lettersRevealedCount.value++;
    }

    if (!currentUserAnswer.value.contains('_')) {
      fullyRevealed[currentKeywordIndex.value] = true;
      Get.snackbar(
        'Tüm Harfler Açıldı',
        'Bir sonraki anahtar kelimeye geçiliyor.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      nextKeyword();
    }
  }

    void submitGuess(String guess) {
    final raw = keywords[currentKeywordIndex.value];
    final proc = _processedWord(raw);
    final sanitizedGuess = _sanitize(guess);

    if (sanitizedGuess == proc.toLowerCase()) {
      final total = proc.length;
      final fraction = lettersRevealedCount.value / total;
      final deduction = (fraction * 20).floor();
      final score = 20 - deduction;
      solvedScore.value += score;

      Get.snackbar(
        'Tebrikler!',
        'Anahtar kelime: $raw\nPuan: $score',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      nextKeyword();
    } else {
      Get.snackbar(
        'Yanlış Tahmin',
        'Tekrar deneyin!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void skipKeyword() {
    skipCount++;
    skipPenalty.value += 30;
    if (skipCount >= 3) {
      solvedScore.value = 0;
      endGame();
    } else {
      nextKeyword();
    }
  }

  void nextKeyword() {
    if (currentKeywordIndex.value < keywords.length - 1) {
      Future.delayed(const Duration(milliseconds: 500), () {
        currentKeywordIndex.value++;
        _startCurrentKeyword();
      });
    } else {
      endGame();
    }
  }

  void endGame() {
    timer?.cancel();
    gameOver.value = true;

    if (fullyRevealed.every((f) => f)) {
      finalScore.value = 0;
    } else {
      final bonus = _calculateBonus();
      finalScore.value = solvedScore.value + bonus - skipPenalty.value;
      if (finalScore.value < 0) finalScore.value = 0;
    }

    _savePuzzleScore();
  }

 /// Oyun bittiğinde final puanı hesaplar
  int _calculateBonus() {
    const bonusTime = 50;
    final rem = remainingSeconds.value > bonusTime
        ? bonusTime
        : remainingSeconds.value;
    return ((rem / bonusTime) * 40).floor();
  }

  /// Anlık bonus puanını döner
  int get currentBonus => _calculateBonus();

  String get currentHint => hints[currentKeywordIndex.value];

  // --- Yardımcı metotlar ---

  /// Ham kelimeyi (örn. "Hazar Gölü") boşluksuz hale getirir.
  String _processedWord(String raw) => raw.replaceAll(' ', '');

  /// Kullanıcının tahminini normalize eder (boşluk sil, küçük harfe çevir).
  String _sanitize(String input) =>
    input.replaceAll(' ', '').toLowerCase();

  Future<void> _savePuzzleScore() async {
    try {
      final box = GetStorage();
      final userId = box.read<String>('currentUserId') ?? '';
      await _firebaseService.addPuzzleGameScore(
        username: userId,
        cityName: cityName,
        score: finalScore.value,
      );

      final raw = box.read('puzzleGameScores') ?? <String, dynamic>{};
      final scores = Map<String, int>.from(raw);
      scores[cityName] = finalScore.value;
      box.write('puzzleGameScores', scores);
    } catch (e) {
      debugPrint('Puzzle score save failed: \$e');
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
