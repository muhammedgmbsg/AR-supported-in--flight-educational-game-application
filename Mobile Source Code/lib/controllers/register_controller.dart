import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/services/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_beta/views/homeScreen.dart';

// lib/controllers/register_controller.dart

class RegisterController extends GetxController {
  ThemeController themeController = Get.find();
  final isLoading = false.obs;
  final username      = ''.obs;
  final password      = ''.obs;
  final age           = ''.obs;
  final usernameError = ''.obs;
  final passwordError = ''.obs;
  final ageError      = ''.obs;

  final FirebaseService _firebaseService = FirebaseService();

  /// Başarılıysa true, hata varsa false döner ve Snackbar gösterir.
Future<bool> register() async {
  usernameError.value = '';
  passwordError.value = '';
  ageError.value      = '';

  // Validasyon
  if (username.value.isEmpty) {
    usernameError.value = 'Kullanıcı adı boş olamaz';
    print('Register validation failed: username is empty');
    return false;
  }
  if (password.value.length < 6) {
    passwordError.value = 'Şifre en az 6 karakter olmalı';
    print('Register validation failed: password too short (${password.value.length})');
    return false;
  }
  int parsedAge;
  try {
    parsedAge = int.parse(age.value);
    if (parsedAge <= 0) {
      ageError.value = 'Yaş pozitif bir sayı olmalı';
      print('Register validation failed: age not positive ($parsedAge)');
      return false;
    }
  } catch (e) {
    ageError.value = 'Geçerli bir yaş girin';
    print('Register validation failed: invalid age input ("${age.value}")');
    return false;
  }

  // Firebase’e gönder
  try {
    
    print('Attempting to register user: username=${username.value}, age=$parsedAge');
    await _firebaseService.registerUser(
      username: username.value,
      password: password.value,
      age: parsedAge,
    );

    print('Register success for user: ${username.value}');
    Get.snackbar(
      'Başarılı',
      'Kayıt işlemi tamamlandı. Giriş yapabilirsiniz.',
      backgroundColor: themeController.buttonColor,

      snackPosition: SnackPosition.BOTTOM,
    );
    return true;
  } catch (e, stack) {
    print('Register exception for user ${username.value}: $e');
    print(stack);
    Get.snackbar(
      'Hata',
      'Kayıt sırasında bağlantı sorunu oluştu.',
      backgroundColor: Colors.red,

      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }
}

}
