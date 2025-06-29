import 'dart:convert';
import 'package:ar_beta/services/firebaseService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final username = ''.obs;
  final password = ''.obs;
  final usernameError = ''.obs;
  final passwordError = ''.obs;
  final age=0.obs;
  final easyMode = false.obs;

  /// Oturum açan kullanıcının ID’si (username)
  final currentUserId = ''.obs;

  final FirebaseService _firebaseService = FirebaseService();
  final box = GetStorage();


  @override
  void onInit() {
    super.onInit();
      final box = GetStorage();

    // Eğer daha önce local’de yaş bilgisi varsa onu yükle
    final storedAge = box.read<int>('currentAge');
    if (storedAge != null) {
      age.value = storedAge;
      checkEasyMode();
    }
  }

   void checkEasyMode() {
    easyMode.value = age.value >= 10;
  }

  /// Giriş başarılıysa true, değilse false döner.
  Future<bool> login() async {
    // Hata mesajlarını temizle
    usernameError.value = '';
    passwordError.value = '';

    // Validasyon
    if (username.value.isEmpty) {
      usernameError.value = 'Kullanıcı adı boş olamaz';
      return false;
    }
    if (password.value.isEmpty) {
      passwordError.value = 'Şifre boş olamaz';
      return false;
    }

    try {
      // 1) Firebase ile giriş
      final ok = await _firebaseService.loginUser(
        username: username.value,
        password: password.value,
      );
      if (!ok) {
       
        return false;
      }

      // 2) Kimliği sakla GetStorage ile
      currentUserId.value = username.value;
      box.write('username', username.value);
      box.write('currentUserId', username.value);

      // 3) Firestore’dan AR puanlarını çek ve kaydet
      final arScores =
          await _firebaseService.getArCityScores(username.value);
      box.write('arCityScores', arScores);

      // 4) Firestore’dan Puzzle puanlarını çek ve kaydet
      final puzzleScores =
          await _firebaseService.getPuzzleScores(username.value);
      box.write('puzzleGameScores', puzzleScores);

      return true;
    } catch (e) {
      // Bağlantı veya başka hata
      Get.snackbar(
        'Bağlantı Hatası',
        'Lütfen internet bağlantınızı kontrol edin',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
