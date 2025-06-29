import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/model/city.dart';
import 'package:ar_beta/model/flightRoute.dart';
import 'package:ar_beta/views/arGameOnboard.dart';
import 'package:ar_beta/views/gameStartScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityDetailScreen extends StatelessWidget {
  final City city;
  final FlightRoute route;

  const CityDetailScreen({Key? key, required this.city, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => Scaffold(
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: themeController.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        city.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themeController.textColor,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // AR OYUNU GÖRSELİ + ALT ORTA BUTON
                      _buildGameCard(
                        imagePath: "images/ar_game.jpeg",
                        buttonLabel: "AR Oyununa Geç",
                        icon: Icons.vrpano,
                        onTap: () => Get.to(() => ArGameOnboard(cityName: city.name)),
                        themeController: themeController,
                      ),

                      const SizedBox(height: 24),

                      // KELİME OYUNU GÖRSELİ + ALT ORTA BUTON
                      _buildGameCard(
                        imagePath: "images/kelimeoyunu.jpeg",
                        buttonLabel: "Kelime Oyunu Oyna",
                        icon: Icons.play_arrow,
                        onTap: () => Get.offAll(() => PuzzleStartScreen(city: city, route: route)),
                        themeController: themeController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildGameCard({
    required String imagePath,
    required String buttonLabel,
    required IconData icon,
    required VoidCallback onTap,
    required ThemeController themeController,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 370,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom:20,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(16),
            color: themeController.buttonColor,
            child: ElevatedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, color: themeController.textColor),
              label: Text(
                buttonLabel,
                style: TextStyle(
                  color: themeController.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: themeController.buttonColor,
                shadowColor: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), // Bu boşluk kartların çakışmasını önler
      ],
    );
  }
}
