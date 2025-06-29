import 'package:ar_beta/controllers/login_controller.dart';
import 'package:ar_beta/controllers/puzzleController.dart';
import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/model/city.dart';
import 'package:ar_beta/model/flightRoute.dart';
import 'package:ar_beta/views/routeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PuzzleGameScreen extends StatelessWidget {
  final City city;
  final FlightRoute route;
  const PuzzleGameScreen({Key? key, required this.city, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<LoginController>();
    final PuzzleController puzzleController = Get.put(
// ✅ use named arguments
PuzzleController(
  keywords: city.keywords,
  hints:    city.keywordHints,
  cityName: city.name,
));
    final themeController = Get.find<ThemeController>();
    TextEditingController guessController = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "${city.name} Kelime Oyunu",
                    style: TextStyle(
                      color: themeController.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),

                  // Üst bilgi: Kalan Süre, Pas Ceza, Bonus
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Kalan Süre",
                              style: TextStyle(
                                fontSize: 16,
                                color: themeController.isDarkMode.value ? Colors.white : Colors.black
                              )
                            ),
                            Obx(() => Text(
                                  "${puzzleController.remainingSeconds.value} sn",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: themeController.isDarkMode.value ? Colors.white : Colors.black
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Pas Cezası",
                              style: TextStyle(
                                fontSize: 16,
                                color: themeController.isDarkMode.value ? Colors.white : Colors.black
                              )
                            ),
                            Obx(() => Text(
                                  "${puzzleController.skipPenalty.value}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: themeController.isDarkMode.value ? Colors.white : Colors.black
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Bonus",
                              style: TextStyle(
                                fontSize: 16,
                                color: themeController.isDarkMode.value ? Colors.white : Colors.black
                              )
                            ),
                            Obx(() => Text(
                                  "${puzzleController.currentBonus}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: themeController.isDarkMode.value ? Colors.white : Colors.black
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Anahtar kelime kutuları
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: Obx(() {
                      String currentWord =
                          puzzleController.currentUserAnswer.value;
                      return Wrap(
                        key: ValueKey<String>(currentWord),
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: currentWord.split('').map((char) {
                          return Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: char == '_'
                                  ? themeController.isDarkMode.value 
                                      ? Colors.grey[800] 
                                      : Colors.grey[200]
                                  : themeController.accentColor.withOpacity(0.2),
                              border: Border.all(
                                  color: themeController.accentColor, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              char,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: themeController.textColor
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
                  // İpucu metni
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: themeController.accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "İpucu: ${puzzleController.currentHint}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: themeController.textColor
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  const SizedBox(height: 30),
                  // Tahmin girişi ve butonlar
                  TextField(
                    controller: guessController,
                    cursorColor: themeController.accentColor,
                    decoration: InputDecoration(
                      hintText: "Tahmininizi Girin",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    bool disabled = puzzleController.gameOver.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: disabled
                              ? null
                              : () {
                                  puzzleController.submitGuess(guessController.text);
                                  guessController.clear();
                                },
                          icon: Icon(Icons.check, color: themeController.accentColor),
                          label: Text("Tahmini Yap", 
                            style: TextStyle(
                              color: disabled ? Colors.grey : themeController.accentColor
                            )
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: disabled ? null : puzzleController.revealLetter,
                          icon: Icon(Icons.lightbulb, color: themeController.accentColor),
                          label: Text("Harf Al", 
                            style: TextStyle(
                              color: disabled ? Colors.grey : themeController.accentColor
                            )
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: disabled ? null : puzzleController.skipKeyword,
                          icon: Icon(Icons.skip_next, color: themeController.accentColor),
                          label: Text("Pas Geç", 
                            style: TextStyle(
                              color: disabled ? Colors.grey : themeController.accentColor
                            )
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 30),
                  // Oyun bitişinde final puan gösterimi
                  Obx(() {
                    if (puzzleController.gameOver.value) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: themeController.accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "Oyun Bitti! Final Skorunuz: ${puzzleController.finalScore.value}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: themeController.textColor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30,),
                          ElevatedButton.icon(
                            onPressed: () { 
                              Get.to(RouteScreen(route: route,));
                            },
                            icon: Icon(Icons.save, color: themeController.textColor),
                            label: Text("Kaydet ve Çık", 
                              style: TextStyle(color: themeController.textColor)
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeController.buttonColor,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              textStyle: const TextStyle(fontSize: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: themeController.accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              "Oyun Devam Ediyor",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: themeController.textColor
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 30,),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.to(RouteScreen(route: route,));
                            },
                            icon: Icon(Icons.info, color: themeController.textColor),
                            label: Text("Oyundan Çık", 
                              style: TextStyle(color: themeController.textColor)
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeController.buttonColor,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              textStyle: const TextStyle(fontSize: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
    ));
  }
}


