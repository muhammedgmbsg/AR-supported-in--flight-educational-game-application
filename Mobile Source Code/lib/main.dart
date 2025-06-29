import 'package:ar_beta/controllers/login_controller.dart';
import 'package:ar_beta/log/service/logManager.dart';
import 'package:ar_beta/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controllers/theme_controller.dart';
import 'controllers/breakController.dart';
import 'firebase_options.dart';
import 'views/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
    LogManager().log("Widget binding hazırlandı.");

  // Firebase initialization
  debugPrint('🔄 Firebase başlatılıyor...');
  LogManager().log("🔄 Firebase başlatılıyor...'");


  if (DefaultFirebaseOptions.currentPlatform == null) {
     LogManager().log('Firebase options bulunamadı. Lütfen flutterfire configure komutunu çalıştırın.');
    throw 'Firebase options bulunamadı. Lütfen flutterfire configure komutunu çalıştırın.';
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint('✅ Firebase başarıyla başlatıldı');
       LogManager().log('✅ Firebase başarıyla başlatıldı');


  // Kamera izni iste
  final cameraStatus = await Permission.camera.status;
  if (!cameraStatus.isGranted) {
    await Permission.camera.request();
  }
  Get.put(LoginController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uçuş Rotasyonu & Bulmaca',
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        // Navigator hazır olduktan sonra kontrolcüler
        Get.put(ThemeController());
        Get.put(BreakController());
      }),
    
      home: _initialScreen(),
    );
  }

  Widget _initialScreen() {
            Get.put(ThemeController());

    final box = GetStorage();
    final loggedIn = box.read<String?>('currentUserId') != null;
    return loggedIn
        ? const RouteSelectionScreen()
        :  LoginScreen();
  }
}
