import 'dart:math';
import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/model/city.dart';
import 'package:ar_beta/model/flightRoute.dart';
import 'package:ar_beta/views/cityDetailsScreen.dart';
import 'package:ar_beta/views/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RouteScreen extends StatelessWidget {
  final FlightRoute route;
  const RouteScreen({Key? key, required this.route}) : super(key: key);
double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
  const R = 6371; // Dünya'nın yarıçapı (km)
  final dLat = _degToRad(lat2 - lat1);
  final dLon = _degToRad(lon2 - lon1);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_degToRad(lat1)) * cos(_degToRad(lat2)) *
      sin(dLon / 2) * sin(dLon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return R * c;
}

double _degToRad(double degree) {
  return degree * pi / 180;
}
  @override
  Widget build(BuildContext context) {
    
    final List<City> routeCities = route.cities;
    final themeController = Get.find<ThemeController>();

      // ✅ Toplam mesafe burada hesaplanmalı
  double totalDistance = 0;
  for (int i = 0; i < routeCities.length - 1; i++) {
    totalDistance += haversineDistance(
      routeCities[i].latitude,
      routeCities[i].longitude,
      routeCities[i + 1].latitude,
      routeCities[i + 1].longitude,
    );
  }
    
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text( 
                  "Rota: ${route.start.name} - ${route.end.name}",
                  style: TextStyle(
                    color: themeController.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 15,),
                 GestureDetector(
                  onTap: () {
                    Get.to(RouteSelectionScreen());
                  },
                   child: Row(
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white70,),
                          SizedBox(width: 5,),
                          Text("Rota Ekranına Git",style: TextStyle(color: Colors.white70),)
                        ],
                      ),
                 ),
                                 SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   
                    height: 190,
                    width: double.infinity,
                     decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(94, 0, 0, 0),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                    child:  TurkeyMapWidget(cities: routeCities),
                  ),
                ),
                SizedBox(height: 20,),
   Expanded(
  child: Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: routeCities.length * 2 - 1,
          itemBuilder: (context, index) {
            if (index.isOdd) {
              final current = routeCities[(index - 1) ~/ 2];
              final next = routeCities[(index + 1) ~/ 2];
              final distance = haversineDistance(
                current.latitude,
                current.longitude,
                next.latitude,
                next.longitude,
              );

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    "↓ ${distance.toStringAsFixed(1)} km",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: themeController.isDarkMode.value 
                        ? themeController.textColor.withOpacity(0.8)
                        : const Color.fromARGB(100, 255, 255, 255),
                    ),
                  ),
                ),
              );
            } else {
              final city = routeCities[index ~/ 2];
              return Card(
                color: themeController.isDarkMode.value 
                  ? Colors.black54 
                  : const Color.fromARGB(9, 255, 255, 255),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: themeController.isDarkMode.value 
                      ? themeController.accentColor 
                      : themeController.buttonColor,
                  ),
                  title: Text(
                    city.name,
                    style: TextStyle(
                      color: themeController.isDarkMode.value 
                        ? themeController.textColor 
                        : Colors.white60,
                    ),
                  ),
                  subtitle: Text(
                    "Lat: ${city.latitude}, Lng: ${city.longitude}",
                    style: TextStyle(
                      color: themeController.isDarkMode.value 
                        ? themeController.textColor.withOpacity(0.7) 
                        : Colors.white60,
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: 
                         const Color.fromARGB(212, 0, 128, 255),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text("Oyunlara Geç",style: TextStyle(fontSize: 10,color: themeController.isDarkMode.value 
                            ? themeController.textColor.withOpacity(0.7) 
                            : Colors.white60, ),),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => CityDetailScreen(city: city, route: route));
                  },
                ),
              );
            }
          },
        ),
      ),

      // 🚀 Toplam Mesafe Göstergesi
      Container(
        decoration: BoxDecoration(
           boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(36, 27, 26, 26),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
          borderRadius: BorderRadius.circular(12),
          color: themeController.isDarkMode.value 
                  ? const Color.fromARGB(151, 39, 39, 39) : const Color.fromARGB(33, 33, 149, 243)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Toplam Uçuş Mesafesi: ${totalDistance.toStringAsFixed(1)} km",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: themeController.isDarkMode.value 
                ? themeController.textColor 
                : const Color.fromARGB(206, 255, 255, 255),
            ),
          ),
        ),
      ),
      SizedBox(height: 40,)
    ],
  ),
)


              ],
            ),
          ),
        ),
      ),
    ));
  }
}


 // Yukarıdaki widget'ı bu dosyaya taşıyın veya uygun konumda import edin.

class TurkeyMapScreen extends StatelessWidget {
  final List<City> cities;
  const TurkeyMapScreen({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Türkiye Haritası"),backgroundColor: Colors.purple,),
      body: Center(child: TurkeyMapWidget(cities: cities)),
    );
  }
}

class TurkeyMapWidget extends StatelessWidget {
  final List<City> cities;
  const TurkeyMapWidget({Key? key, required this.cities}) : super(key: key);

  // Haritanın kapsadığı coğrafi sınırlar (resminizdeki coğrafi alanı kesin olarak belirleyin)
  static const double minLat = 36.0;
  static const double maxLat = 42.0;
  static const double minLng = 26.0;
  static const double maxLng = 45.0;

  // Harita asset'inizin orijinal boyutları: burada 1600x777 (dosyanızın 1807x777 gibi eski örnekten farklı olabilir)
  static const double mapImageWidth = 1508.0;
  static const double mapImageHeight = 636.0;

  /// Şehir koordinatlarını, container içindeki gerçek harita gösterim alanına göre hesaplar.
  Offset _calculateOffset({
    required double lat,
    required double lng,
    required double displayedWidth,
    required double displayedHeight,
    required double offsetX,
    required double offsetY,
  }) {
    // Enlem değerlerinin ters çevrildiğine dikkat: widget'larda y aşağıya artıyor.
    double relativeX = (lng - minLng) / (maxLng - minLng);
    double relativeY = (maxLat - lat) / (maxLat - minLat);
    double posX = offsetX + relativeX * displayedWidth;
    double posY = offsetY + relativeY * displayedHeight;
    return Offset(posX, posY);
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return LayoutBuilder(builder: (context, constraints) {
    
      final double containerWidth = constraints.maxWidth;
      final double containerHeight = constraints.maxHeight;

      // Resmin container'a sığdırılması sırasında hesaplanan scale değeri
      double scale = min(
        containerWidth / mapImageWidth,
        containerHeight / mapImageHeight,
      );
      double displayedWidth = mapImageWidth * scale;
      double displayedHeight = mapImageHeight * scale;

      // Resmin container içinde tam ortalanması için offset değerleri
      double offsetX = (containerWidth - displayedWidth) / 2;
      double offsetY = (containerHeight - displayedHeight) / 2;

      // Şehirlerin container içindeki pozisyonlarını hesaplayalım.
      final List<Offset> cityPositions = cities.map((city) {
        return _calculateOffset(
          lat: city.latitude,
          lng: city.longitude,
          displayedWidth: displayedWidth,
          displayedHeight: displayedHeight,
          offsetX: offsetX,
          offsetY: offsetY,
        );
      }).toList();

      return Stack(
        children: [
          // Arka planda Türkiye haritası resmi: resmin tamamının görünmesi için BoxFit.contain kullanılıyor.
          Positioned.fill(
            child: Image.asset(
              'images/map3.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Şehirler arası ince çizgiyi çizen katman.
          Positioned.fill(
            child: CustomPaint(
              painter: RouteLinePainter(cityPositions: cityPositions),
            ),
          ),
          // Her iki şehir arasına uçak ikonları yerleştiriliyor.
          ..._buildAirplaneIcons(cityPositions),
          // Şehir marker'ları
          ...cityPositions.map((pos) {
            return Positioned(
              left: pos.dx - 12,
              top: pos.dy - 12,
              child: GestureDetector(
                onTap: () {
                  // Marker tıklanırsa detay ekranına geçiş gibi işlemler ekleyebilirsiniz.
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 22,
                    ),
                    
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      );
    });
  }

  // Şehirler arası her segmentin orta noktasına uçak ikonu yerleştirir.
  List<Widget> _buildAirplaneIcons(List<Offset> positions) {
    List<Widget> icons = [];
    // İki nokta arasında uçak ikonu yerleştirmek için her ardışık çift için
    for (int i = 0; i < positions.length - 1; i++) {
      Offset start = positions[i];
      Offset end = positions[i + 1];
      // Segmentin orta noktası:
      Offset midpoint = Offset((start.dx + end.dx) / 2, (start.dy + end.dy) / 2);
      // İki nokta arasındaki açıyı hesaplayın (radyan cinsinden)
      double angle = atan2(end.dy - start.dy, end.dx - start.dx);
      icons.add(
        Positioned(
          // Uçak ikonunun merkezi orta noktaya denk gelecek şekilde ayarlanıyor.
          left: midpoint.dx - 12,
          top: midpoint.dy - 12,
          child: Transform.rotate(
            angle: angle,
            child: const Icon(
              Icons.airplanemode_active,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      );
    }
    return icons;
  }
}

/// Şehir marker'ları arasında ince çizgi çizen CustomPainter.
class RouteLinePainter extends CustomPainter {
  final List<Offset> cityPositions;
  final themeController = Get.find<ThemeController>();

  RouteLinePainter({required this.cityPositions});

  @override
  void paint(Canvas canvas, Size size) {
    if (cityPositions.isEmpty) return;

    Paint paint = Paint()
      ..color = themeController.buttonColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(cityPositions.first.dx, cityPositions.first.dy);
    for (var pos in cityPositions.skip(1)) {
      path.lineTo(pos.dx, pos.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant RouteLinePainter oldDelegate) {
    return oldDelegate.cityPositions != cityPositions;
  }
}
