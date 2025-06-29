import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../controllers/theme_controller.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    final themeController    = Get.find<ThemeController>();

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
                  // Logo
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
                      labelStyle: TextStyle(
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: themeController.accentColor.withOpacity(0.7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      errorText: registerController.usernameError.value.isEmpty
                          ? null
                          : registerController.usernameError.value,
                      errorStyle: TextStyle(color: themeController.accentColor),
                    ),
                    onChanged: (v) => registerController.username.value = v,
                  )),
                  const SizedBox(height: 16),

                  // — Şifre —
                  Obx(() => TextField(
                    style: TextStyle(color: themeController.textColor),
                    cursorColor: themeController.accentColor,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      labelStyle: TextStyle(
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: themeController.accentColor.withOpacity(0.7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      errorText: registerController.passwordError.value.isEmpty
                          ? null
                          : registerController.passwordError.value,
                      errorStyle: TextStyle(color: themeController.accentColor),
                    ),
                    onChanged: (v) => registerController.password.value = v,
                  )),
                  const SizedBox(height: 16),

                  // — Yaş —
                  Obx(() => TextField(
                    style: TextStyle(color: themeController.textColor),
                    cursorColor: themeController.accentColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Yaş',
                      labelStyle: TextStyle(
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      prefixIcon: Icon(
                        Icons.cake,
                        color: themeController.textColor.withOpacity(0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: themeController.accentColor.withOpacity(0.7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: themeController.accentColor),
                      ),
                      errorText: registerController.ageError.value.isEmpty
                          ? null
                          : registerController.ageError.value,
                      errorStyle: TextStyle(color: themeController.accentColor),
                    ),
                    onChanged: (v) => registerController.age.value = v,
                  )),
                  const SizedBox(height: 24),

                  // — Kayıt Butonu —
                  Obx(() => ElevatedButton(
                    onPressed: registerController.isLoading.value
                        ? null
                        : () async {
                            registerController.isLoading.value = true;
                            final success = await registerController.register();
                            if (success) {
                              Get.offAll(() => LoginScreen());
                            }
                            else {
                               Get.snackbar(
      'Hata',
      'Bu kullanıcı adı daha önce kullanılmış',
      backgroundColor: themeController.buttonColor,

      snackPosition: SnackPosition.BOTTOM,
    );
                            }
                                                        registerController.isLoading.value = false;

                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeController.buttonColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: registerController.isLoading.value
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: themeController.textColor,
                            ),
                          )
                        : Text(
                            'Kayıt Ol',
                            style: TextStyle(
                              fontSize: 18,
                              color: themeController.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
