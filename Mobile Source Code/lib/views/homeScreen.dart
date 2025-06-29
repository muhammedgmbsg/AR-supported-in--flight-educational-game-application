import 'dart:convert';
import 'package:ar_beta/log/views/logScreen.dart';
import 'package:ar_beta/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/theme_controller.dart';
import '../model/city.dart';
import '../model/flightRoute.dart';
import '../views/routeScreen.dart';

/// Skorları listeleyen ekran
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

/// Skorları listeleyen ekran
class ScoreScreen extends StatelessWidget {
  final String title;
  final Map<String, int> scores;

  const ScoreScreen({Key? key, required this.title, required this.scores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık
                Text(
                  title,
                  style: TextStyle(
                    color: themeController.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Skor listesi veya boş mesaj
                Expanded(
                  child: scores.isEmpty
                      ? Center(
                          child: Text(
                            'Henüz skor bulunamadı',
                            style: TextStyle(
                              color: themeController.textColor.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: scores.length,
                          itemBuilder: (context, index) {
                            final entry = scores.entries.elementAt(index);
                            return Card(
                              color: Colors.white.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(
                                  entry.key,
                                  style: TextStyle(
                                    color: themeController.textColor,
                                  ),
                                ),
                                trailing: Text(
                                  '${entry.value} puan',
                                  style: TextStyle(
                                    color: themeController.accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class RouteSelectionScreen extends StatefulWidget {
  const RouteSelectionScreen({Key? key}) : super(key: key);

  @override
  _RouteSelectionScreenState createState() => _RouteSelectionScreenState();
}

class _RouteSelectionScreenState extends State<RouteSelectionScreen> {
  City? selectedStart;
  City? selectedEnd;
  final themeController = Get.find<ThemeController>();
  final box = GetStorage();

 // Tüm 81 ilin City model nesneleri olarak tanımlandığını varsayıyoruz:
final List<City> allCities = const [
  adana,
  adiyaman,
  afyonkarahisar,
  agri,
  amasya,
  ankara,
  antalya,
  ardahan,
  artvin,
  aydin,
  balikesir,
  bartin,
  batman,
  bayburt,
  bilecik,
  bingol,
  bitlis,
  bolu,
  burdur,
  bursa,
  canakkale,
  cankiri,
  corum,
  denizli,
  diyarbakir,
  duzce,
  edirne,
  elazig,
  erzincan,
  erzurum,
  eskisehir,
  gaziantep,
  giresun,
  gumushane,
  hakkari,
  hatay,
  igdir,
  isparta,
  istanbul,
  izmir,
  kahramanmaras,
  karabuk,
  karaman,
  kars,
  kastamonu,
  kayseri,
  kilis,
  kirikkale,
  kirklareli,
  kirsehir,
  kocaeli,
  konya,
  kutahya,
  malatya,
  manisa,
  mardin,
  mersin,
  mugla,
  mus,
  nevsehir,
  nigde,
  ordu,
  osmaniye,
  rize,
  sakarya,
  samsun,
  sanliurfa,
  siirt,
  sinop,
  sirnak,
  sivas,
  tekirdag,
  tokat,
  trabzon,
  tunceli,
  usak,
  van,
  yalova,
  yozgat,
  zonguldak,
];


  @override
  void initState() {
    super.initState();
    selectedStart = allCities.first;
    selectedEnd = allCities.last;
  }

  void _showProfileOptions() {
    final username = box.read('username') ?? '';
    final arScores = Map<String,int>.from(box.read('arCityScores') ?? {});
    final puzzleScores = Map<String,int>.from(box.read('puzzleGameScores') ?? {});
    Get.bottomSheet(
      Container(
        color: themeController.isDarkMode.value ? Colors.grey[900] : Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(username,style: TextStyle(color: themeController.isDarkMode.value ?Colors.white :Colors.grey[900] ),),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.view_in_ar),
              title:  Text('AR Puanlarım',style: TextStyle(color: themeController.isDarkMode.value ?Colors.white :Colors.grey[900] ),),
              onTap: () {
                Get.back();
                Get.to(() => ScoreScreen(
                  title: 'AR Puanlarım',
                  scores: arScores,
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.games_outlined),
              title:  Text('Puzzle Puanlarım',style: TextStyle(color: themeController.isDarkMode.value ?Colors.white :Colors.grey[900] ),),
              onTap: () {
                Get.back();
                Get.to(() => ScoreScreen(
                  title: 'Puzzle Puanlarım',
                  scores: puzzleScores,
                ));
              },
            ),
               ListTile(
              leading: const Icon(Icons.lightbulb),
              title:  Text('Hata Ayıklama (Developer Test Mode)',style: TextStyle(color: themeController.isDarkMode.value ?Colors.white :Colors.grey[900] ),),
              onTap: () {
                Get.back();
                Get.to(() => LogView());
              },
            ),
              // Log görüntüleme butonu
             
           // const SizedBox(height: 8),
            ListTile(
  leading: const Icon(Icons.logout),
  title: Text('Çıkış Yap',style: TextStyle(color: themeController.isDarkMode.value ?Colors.white :Colors.grey[900] ),),
  onTap: () {
    // 1) Lokal oturum bilgilerini sil
    box.remove('currentUserId');
    box.remove('username');
    box.remove('arCityScores');
    box.remove('puzzleGameScores');
    // 2) Sheet’i kapat
    Get.back();
    // 3) Tüm ekranları temizleyip LoginScreen’e dön
    Get.offAll(() => LoginScreen());
  },
),
            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: themeController.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                // Replace this Align block:


// With this Row containing both icons:
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Obx(() => IconButton(
      icon: Icon(
        themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
        color: themeController.buttonColor,
        size: 32,
      ),
      onPressed: () {
        themeController.toggleTheme();
        setState(() {});
      },
    )),
    const SizedBox(width: 8),
    IconButton(
      icon: Icon(
        Icons.account_circle,
        color: themeController.buttonColor,
        size: 32,
      ),
      onPressed: _showProfileOptions,
    ),
  ],
),

                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 175,
                      height: 175,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset('images/logo.png', fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      "Nereye Gidiyoruz ?",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildDropdown(
                    label: "Kalkış",
                    value: selectedStart,
                    onChanged: (city) => setState(() => selectedStart = city),
                  ),
                  const SizedBox(height: 16),
                  _buildDropdown(
                    label: "Varış",
                    value: selectedEnd,
                    onChanged: (city) => setState(() => selectedEnd = city),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: themeController.buttonColor,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 5,
                    ),
                    onPressed: () {
                      final selectedRoute =
                          flightRoutes.firstWhereOrNull((route) =>
                              route.start.name == selectedStart!.name &&
                              route.end.name == selectedEnd!.name);
                      if (selectedRoute != null) {
                        Get.to(() => RouteScreen(route: selectedRoute));
                      } else {
                        Get.snackbar(
                          'Hata',
                          'Seçtiğiniz şehirler arası rota bulunamadı.',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    child: Text(
                      "Yolculuğa Başla",
                      style: TextStyle(
                          color: themeController.buttonColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required City? value,
    required ValueChanged<City?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white70),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: themeController.buttonColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          DropdownButton<City>(
            isExpanded: true,
            underline: const SizedBox(),
            value: value,
            icon: Icon(Icons.arrow_drop_down,
                color: themeController.buttonColor),
            items: allCities.map((city) {
              return DropdownMenuItem<City>(
                value: city,
                child: Text(city.name,
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
