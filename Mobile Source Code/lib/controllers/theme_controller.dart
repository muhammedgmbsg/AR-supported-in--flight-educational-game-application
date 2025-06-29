import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Theme mode state
  final isDarkMode = false.obs;

  // Light theme colors
  static const lightGradientColors = [Color(0xFF0D47A1),  Color(0xFF000000)]; // Koyu mavi tonları
  static const lightTextColor = Colors.white;
  static const lightButtonColor = Color(0xFF1976D2); // Mavi
  static const lightAccentColor = Color(0xFF42A5F5); // Açık mavi

  // Dark theme colors
  static const darkGradientColors = [Colors.black87, Color(0xFF000000)]; // Daha koyu gradient
  static const darkTextColor = Color(0xFFE0E0E0); // Açık gri metin
  static const darkButtonColor = Colors.black; // Açık mor
  static const darkAccentColor = Color.fromARGB(255, 4, 115, 207); // Koyu mor

  // Get current gradient colors based on theme mode
  List<Color> get gradientColors => isDarkMode.value ? darkGradientColors : lightGradientColors;
  
  // Get current text color based on theme mode
  Color get textColor => isDarkMode.value ? darkTextColor : lightTextColor;

  // Get current button color based on theme mode
  Color get buttonColor => isDarkMode.value ? darkButtonColor : lightButtonColor;

  // Get current accent color based on theme mode
  Color get accentColor => isDarkMode.value ? darkAccentColor : lightAccentColor;

  // Toggle theme mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
} 