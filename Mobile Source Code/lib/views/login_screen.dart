import 'package:ar_beta/views/homeScreen.dart';
import 'package:ar_beta/views/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/theme_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeController.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 175,
                    height: 175,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('images/logo.png', fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 40),

                  // — Kullanıcı Adı —
                  Obx(() => TextField(
                    style: TextStyle(color: themeController.textColor),
                    cursorColor: themeController.accentColor,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      labelStyle: TextStyle(color: themeController.textColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.person, color: themeController.textColor.withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor.withOpacity(0.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      errorText: loginController.usernameError.value.isEmpty
                          ? null
                          : loginController.usernameError.value,
                      errorStyle: TextStyle(color: themeController.accentColor),
                    ),
                    onChanged: (value) => loginController.username.value = value,
                  )),
                  const SizedBox(height: 16),

                  // — Şifre —
                  Obx(() => TextField(
                    style: TextStyle(color: themeController.textColor),
                    cursorColor: themeController.accentColor,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      labelStyle: TextStyle(color: themeController.textColor.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.lock, color: themeController.textColor.withOpacity(0.7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor.withOpacity(0.7)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      errorText: loginController.passwordError.value.isEmpty
                          ? null
                          : loginController.passwordError.value,
                      errorStyle: TextStyle(color: themeController.accentColor),
                    ),
                    onChanged: (value) => loginController.password.value = value,
                  )),
                  const SizedBox(height: 24),

                  // — Giriş Butonu —
                  Obx(() => ElevatedButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : () async {
                          loginController.isLoading.value = true;
                            final success = await loginController.login();
                            if (success) {
                              Get.snackbar(
                                'Başarılı',
                                'Rota ekranına yönlendiriliyorsunuz...',
                                backgroundColor: themeController.buttonColor,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              Get.to(() => RouteSelectionScreen());
                            } else {
                              Get.snackbar(
                                'Giriş Hatası',
                                'Kullanıcı adı/şifre yanlış ya da bağlantı sorunu.',
                                backgroundColor: Colors.red,

                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                                                      loginController.isLoading.value = false;

                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeController.buttonColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: loginController.isLoading.value
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: themeController.textColor,
                            ),
                          )
                        : Text(
                            'Giriş Yap',
                            style: TextStyle(
                              fontSize: 18,
                              color: themeController.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  )),
                  const SizedBox(height: 16),

                  // — Kayıt Ol linki —
                  TextButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : () => Get.to(() => const RegisterScreen()),
                    child: Text(
                      'Hesabın yok mu? Kayıt Ol',
                      style: TextStyle(
                        color: themeController.accentColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}