import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../R/ar_screen.dart';

class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry({
    required this.name,
    required this.score,
  });
}

class InstructionModel {
  final String title;
  final String description;
  final IconData icon;

  InstructionModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class ArGameOnboard extends StatefulWidget {
  final String cityName;
  const ArGameOnboard({Key? key, required this.cityName}) : super(key: key);

  @override
  State<ArGameOnboard> createState() => _ArGameOnboardState();
}

class _ArGameOnboardState extends State<ArGameOnboard>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final ThemeController themeController = Get.find();

  late List<InstructionModel> instructions;
  late AnimationController _animationController;

  bool _showInitialButtons = true;
  bool _loadingLeaderboard = true;
  List<LeaderboardEntry> leaderboard = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _loadLeaderboard();

    instructions = [
      InstructionModel(
        title: "AR Hafıza Oyunu",
        description:
            "Bu oyunda, ${widget.cityName} şehrine ait fotoğrafları eşleştirmeniz gerekiyor. Fotoğraflar 3D küpler halinde karşınıza çıkacak.",
        icon: Icons.view_in_ar,
      ),
      InstructionModel(
        title: "Nasıl Oynanır?",
        description:
            "Küplere dokunarak onları çevirin. İki küpü çevirdiğinizde, eğer fotoğraflar eşleşirse küpler kaybolacak. Eşleşmezse tekrar kapanacaklar.",
        icon: Icons.touch_app,
      ),
      InstructionModel(
        title: "Oyun Amacı",
        description:
            "Tüm fotoğraf çiftlerini en kısa sürede eşleştirmeye çalışın. Oyun, tüm çiftleri bulduğunuzda tamamlanır.",
        icon: Icons.emoji_events,
      ),
      InstructionModel(
        title: "İpuçları",
        description:
            "Fotoğrafların konumlarını hatırlamaya çalışın. Her hamlenizi dikkatli planlayın ve hafızanızı kullanın.",
        icon: Icons.lightbulb,
      ),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadLeaderboard() async {
    try {
      // Tüm arCityPuan dökümanlarını çek
      final snapshot = await FirebaseFirestore.instance
          .collectionGroup('arCityPuan')
          .get();

      // Belirli cityName'e sahip kayıtları filtrele
      final filtered = snapshot.docs.where(
        (doc) => doc.id == widget.cityName,
      );

      final entries = filtered.map((doc) {
        final score = (doc.data()['score'] as num).toInt();
        final userId = doc.reference.parent.parent!.id;
        return LeaderboardEntry(name: userId, score: score);
      }).toList();

      // Puanlara göre sıralayıp en yüksek 5'i al
      entries.sort((a, b) => b.score.compareTo(a.score));
      final limited = entries.length > 5 ? entries.sublist(0, 5) : entries;

      setState(() {
        leaderboard = limited;
        _loadingLeaderboard = false;
      });
    } catch (e) {
      print('Error loading leaderboard: $e');
      setState(() {
        leaderboard = [];
        _loadingLeaderboard = false;
      });
    }
  }

  void _startGame() {
    Get.off(() => ArCoreScreen(cityName: widget.cityName));
  }

  void _showOnboarding() {
    setState(() {
      _showInitialButtons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showInitialButtons) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
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
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "${widget.cityName} AR Oyunu",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: themeController.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? Colors.black54
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.leaderboard,
                            size: 48,
                            color: themeController.accentColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "En İyi Skorlar",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (_loadingLeaderboard)
                            const Center(child: CircularProgressIndicator())
                          else if (leaderboard.isEmpty)
                            Text(
                              'Henüz oyuncular bu oyunu oynamamış!',
                              style: TextStyle(
                                fontSize: 16,
                                color: themeController.isDarkMode.value
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            )
                          else
                            ...leaderboard.map((player) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: themeController.accentColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      player.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: themeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${player.score} puan",
                                      style: TextStyle(
                                        color: themeController.isDarkMode.value
                                            ? Colors.white70
                                            : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: _showOnboarding,
                      icon: Icon(Icons.school,
                          color: themeController.textColor),
                      label: Text(
                        "Oyunu Öğren",
                        style: TextStyle(
                          color: themeController.textColor,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeController.buttonColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _startGame,
                      icon: Icon(Icons.play_arrow,
                          color: themeController.textColor),
                      label: Text(
                        "Oyuna Başla",
                        style: TextStyle(
                          color: themeController.textColor,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeController.buttonColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Onboarding pages...
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeController.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                "AR Oyun Kuralları",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: themeController.textColor,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: instructions.length + 1,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    if (index < instructions.length) {
                      return InstructionCard(model: instructions[index]);
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hazır mısın?",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: themeController.textColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: _startGame,
                              icon: Icon(Icons.play_arrow, color: themeController.textColor),
                              label: Text(
                                "Oyuna Başla",
                                style: TextStyle(
                                  color: themeController.textColor,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themeController.buttonColor,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    instructions.length + 1,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? themeController.accentColor
                            : themeController.accentColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InstructionCard extends StatelessWidget {
  final InstructionModel model;
  final ThemeController themeController = Get.find();

  InstructionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            model.icon,
            size: 64,
            color: themeController.accentColor,
          ),
          const SizedBox(height: 24),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeController.isDarkMode.value ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            style: TextStyle(
              fontSize: 16,
              color: themeController.isDarkMode.value ? Colors.white70 : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 