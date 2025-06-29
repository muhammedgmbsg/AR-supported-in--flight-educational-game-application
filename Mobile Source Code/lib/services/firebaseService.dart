import 'dart:convert';
import 'package:ar_beta/controllers/login_controller.dart';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class FirebaseService {
  final CollectionReference<Map<String, dynamic>> _usersRef =
      FirebaseFirestore.instance.collection('users');

  // SHA-256 ile basit hash fonksiyonu
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Yeni bir kullanıcı kaydı oluşturur.
  /// - Eğer username zaten kayıtlıysa false döner, aksi halde true.
  Future<bool> registerUser({
    required String username,
    required String password,
    required int age,
  }) async {
    final doc = await _usersRef.doc(username).get();
    if (doc.exists) {
      // Kullanıcı adı zaten alınmış
      return false;
    }

    final hashedPassword = _hashPassword(password);
    await _usersRef.doc(username).set({
      'password': hashedPassword,
      'age': age,
    });
    return true;
  }

  /// Giriş kontrolü. Parola eşleşiyorsa true döner.
  /// Giriş kontrolü. Parola eşleşiyorsa true döner ve LoginController.age ataması yapılır.
   Future<bool> loginUser({
  required String username,
  required String password,
}) async {
  final doc = await _usersRef.doc(username).get();
  if (!doc.exists) return false;

  final data = doc.data()!;
  final storedHash = data['password'] as String;
  final inputHash = _hashPassword(password);
      debugPrint(inputHash);
      debugPrint(storedHash);

  if (storedHash == inputHash) {
    // Yaşı alıp LoginController'a ata
    final userAge = (data['age'] as num).toInt();
    final loginCtrl = Get.find<LoginController>();
    loginCtrl.age.value = userAge;
    loginCtrl.checkEasyMode();

      debugPrint("000");
    // --- Burada storage’a yazalım ---
    final box = GetStorage();
    box.write('currentUserId', username);
    box.write('currentAge', userAge);
      print("123");

    return true;
  }
  return false;
}

  /// AR şehir puanını kaydeder
  Future<void> addArCityScore({
    required String username,
    required String cityName,
    required int score,
  }) async {
    await _usersRef
        .doc(username)
        .collection('arCityPuan')
        .doc(cityName)
        .set({'score': score});
  }

  /// Puzzle oyunu puanını kaydeder
  Future<void> addPuzzleGameScore({
    required String username,
    required String cityName,
    required int score,
  }) async {
    await _usersRef
        .doc(username)
        .collection('puzzleGameScores')
        .doc(cityName)
        .set({'score': score});
  }

  /// Tüm AR şehir puanlarını döner
  Future<Map<String,int>> getArCityScores(String username) async {
    final snap = await _usersRef
        .doc(username)
        .collection('arCityPuan')
        .get();
    return {
      for (var d in snap.docs)
        d.id : (d.data()['score'] as num).toInt()
    };
  }

  /// Tüm puzzle puanlarını döner
  Future<Map<String,int>> getPuzzleScores(String username) async {
    final snap = await _usersRef
        .doc(username)
        .collection('puzzleGameScores')
        .get();
    return {
      for (var d in snap.docs)
        d.id : (d.data()['score'] as num).toInt()
    };
  }
}
