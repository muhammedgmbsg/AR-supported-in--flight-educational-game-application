import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/model/city.dart';
import 'package:ar_beta/model/flightRoute.dart';
import 'package:ar_beta/views/awartWidget.dart';
import 'package:ar_beta/views/gameOnboard.dart';
import 'package:ar_beta/views/gameScreen.dart';
import 'package:ar_beta/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PuzzleStartScreen extends StatelessWidget {
  final City city;
  final FlightRoute route;
  
  const PuzzleStartScreen({Key? key, required this.city, required this.route}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeController.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                                SizedBox(height:100,),

                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.to(RouteSelectionScreen());
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back,color: Colors.white70,),
                        SizedBox(width: 5,),
                        Text("Rota Ekranına Git",style: TextStyle(color: Colors.white70),)
                      ],
                    ))),
                Spacer(),
                // Üstte şehrin adı ile "Dereceleri" başlığı
                Text(
                  "${city.name} Dereceleri",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: themeController.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              SizedBox(
                  height: 150,
                  child: TopAwardsWidget(cityName: city.name,),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // Oyuna Başla butonuna basılırsa oyun ekranına geçiş yapar.
                    Get.to(() => PuzzleGameScreen(city: city, route: route));
                  },
                  icon: const Icon(Icons.play_circle, color: Colors.white),
                  label: const Text("Oyuna Başla", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // Öğren butonuna basılırsa bilgilendirme ekranına geçiş yapılır.
                    Get.to(() => PuzzleInfoScreen(city: city, route: route));
                  },
                  icon: const Icon(Icons.info, color: Colors.white),
                  label: const Text("Öğren", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
