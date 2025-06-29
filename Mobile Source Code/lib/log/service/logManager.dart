import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogManager {
  static final LogManager _instance = LogManager._internal();
  factory LogManager() => _instance;
  LogManager._internal();

  final ValueNotifier<List<String>> _logs = ValueNotifier<List<String>>([]);
  ValueNotifier<List<String>> get logs => _logs;

  void log(String message) {
    final timestamp = DateTime.now().toString();
    final logMessage = '[$timestamp] $message';
    
    // Debug konsoluna yazdır
    if (kDebugMode) {
      print(logMessage);
    }
    
    // Log listesine ekle
    _logs.value = [..._logs.value, logMessage];
  }

  void clearLogs() {
    _logs.value = [];
  }
}

//              LogManager().log("Paketlerim ekranı öncesi tüm kodlar çalıştı...");
