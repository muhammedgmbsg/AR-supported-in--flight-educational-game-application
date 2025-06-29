// Uçuş rotası modeli: Başlangıç, bitiş ve rotadaki şehir listesini içerir.
import 'package:ar_beta/model/city.dart';

class FlightRoute {
  final City start;
  final City end;
  final List<City> cities;

  const FlightRoute({
    required this.start,
    required this.end,
    required this.cities,
  });
}
final List<FlightRoute> flightRoutes = [
  // Orijinal rotalar
  FlightRoute(
    start: elazig,
    end: istanbul,
    cities: [elazig, malatya, ankara, istanbul],
  ),
  FlightRoute(
    start: malatya,
    end: istanbul,
    cities: [malatya, kayseri, ankara, istanbul],
  ),
  FlightRoute(
    start: istanbul,
    end: ankara,
    cities: [istanbul, kocaeli, ankara],
  ),
  FlightRoute(
    start: istanbul,
    end: izmir,
    cities: [istanbul, bursa, izmir],
  ),
  FlightRoute(
    start: istanbul,
    end: antalya,
    cities: [istanbul, bursa, antalya],
  ),
  FlightRoute(
    start: istanbul,
    end: adana,
    cities: [istanbul, kocaeli, eskisehir, adana],
  ),
  FlightRoute(
    start: istanbul,
    end: gaziantep,
    cities: [istanbul, sakarya, kahramanmaras, gaziantep],
  ),
  FlightRoute(
    start: istanbul,
    end: trabzon,
    cities: [istanbul, bolu, samsun, ordu, trabzon],
  ),
  FlightRoute(
    start: istanbul,
    end: diyarbakir,
    cities: [istanbul, sakarya, ankara, malatya, diyarbakir],
  ),
  FlightRoute(
    start: istanbul,
    end: kayseri,
    cities: [istanbul, sakarya, ankara, kayseri],
  ),
  FlightRoute(
    start: istanbul,
    end: konya,
    cities: [istanbul, bursa, eskisehir, konya],
  ),
  FlightRoute(
    start: istanbul,
    end: samsun,
    cities: [istanbul, kocaeli, sakarya, samsun],
  ),
  FlightRoute(
    start: istanbul,
    end: erzurum,
    cities: [istanbul, sakarya, erzurum],
  ),
  FlightRoute(
    start: istanbul,
    end: van,
    cities: [istanbul, sakarya, ankara, sivas, van],
  ),
  FlightRoute(
    start: ankara,
    end: izmir,
    cities: [ankara, eskisehir, manisa, izmir],
  ),
  FlightRoute(
    start: ankara,
    end: antalya,
    cities: [ankara, antalya],
  ),
  FlightRoute(
    start: ankara,
    end: trabzon,
    cities: [ankara, ordu, trabzon],
  ),
  FlightRoute(
    start: izmir,
    end: adana,
    cities: [izmir, manisa, denizli, konya, adana],
  ),
  FlightRoute(
    start: izmir,
    end: antalya,
    cities: [izmir, denizli, antalya],
  ),
  FlightRoute(
    start: izmir,
    end: gaziantep,
    cities: [izmir, manisa, denizli, konya, gaziantep],
  ),
  FlightRoute(
    start: izmir,
    end: trabzon,
    cities: [izmir, manisa, ankara, ordu, trabzon],
  ),
  FlightRoute(
    start: izmir,
    end: van,
    cities: [izmir, manisa, kayseri, malatya, van],
  ),
  FlightRoute(
    start: antalya,
    end: trabzon,
    cities: [antalya, konya, sivas, trabzon],
  ),
  FlightRoute(
    start: antalya,
    end: diyarbakir,
    cities: [antalya, kahramanmaras, diyarbakir],
  ),
  FlightRoute(
    start: antalya,
    end: samsun,
    cities: [antalya, konya, samsun],
  ),
  FlightRoute(
    start: antalya,
    end: adana,
    cities: [antalya, mersin, adana],
  ),
  FlightRoute(
    start: ankara,
    end: van,
    cities: [ankara, sivas, van],
  ),

  // Ters yönlü rotalar
  FlightRoute(
    start: istanbul,
    end: elazig,
    cities: [istanbul, ankara, malatya, elazig],
  ),
  FlightRoute(
    start: istanbul,
    end: malatya,
    cities: [istanbul, ankara, kayseri, malatya],
  ),
  FlightRoute(
    start: ankara,
    end: istanbul,
    cities: [ankara, kocaeli, istanbul],
  ),
  FlightRoute(
    start: izmir,
    end: istanbul,
    cities: [izmir, bursa, istanbul],
  ),
  FlightRoute(
    start: antalya,
    end: istanbul,
    cities: [antalya, bursa, istanbul],
  ),
  FlightRoute(
    start: adana,
    end: istanbul,
    cities: [adana, eskisehir, kocaeli, istanbul],
  ),
  FlightRoute(
    start: gaziantep,
    end: istanbul,
    cities: [gaziantep, kahramanmaras, sakarya, istanbul],
  ),
  FlightRoute(
    start: trabzon,
    end: istanbul,
    cities: [trabzon, ordu, samsun, bolu, istanbul],
  ),
  FlightRoute(
    start: diyarbakir,
    end: istanbul,
    cities: [diyarbakir, malatya, ankara, sakarya, istanbul],
  ),
  FlightRoute(
    start: kayseri,
    end: istanbul,
    cities: [kayseri, ankara, sakarya, istanbul],
  ),
  FlightRoute(
    start: konya,
    end: istanbul,
    cities: [konya, eskisehir, bursa, istanbul],
  ),
  FlightRoute(
    start: samsun,
    end: istanbul,
    cities: [samsun, sakarya, kocaeli, istanbul],
  ),
  FlightRoute(
    start: erzurum,
    end: istanbul,
    cities: [erzurum, sakarya, istanbul],
  ),
  FlightRoute(
    start: van,
    end: istanbul,
    cities: [van, sivas, ankara, sakarya, istanbul],
  ),
  FlightRoute(
    start: izmir,
    end: ankara,
    cities: [izmir, manisa, eskisehir, ankara],
  ),
  FlightRoute(
    start: antalya,
    end: ankara,
    cities: [antalya, ankara],
  ),
  FlightRoute(
    start: trabzon,
    end: ankara,
    cities: [trabzon, ordu, ankara],
  ),
  FlightRoute(
    start: adana,
    end: izmir,
    cities: [adana, konya, denizli, manisa, izmir],
  ),
  FlightRoute(
    start: antalya,
    end: izmir,
    cities: [antalya, denizli, izmir],
  ),
  FlightRoute(
    start: gaziantep,
    end: izmir,
    cities: [gaziantep, konya, denizli, manisa, izmir],
  ),
  FlightRoute(
    start: trabzon,
    end: izmir,
    cities: [trabzon, ordu, ankara, manisa, izmir],
  ),
  FlightRoute(
    start: van,
    end: izmir,
    cities: [van, malatya, kayseri, manisa, izmir],
  ),
  FlightRoute(
    start: trabzon,
    end: antalya,
    cities: [trabzon, sivas, konya, antalya],
  ),
  FlightRoute(
    start: diyarbakir,
    end: antalya,
    cities: [diyarbakir, kahramanmaras, antalya],
  ),
  FlightRoute(
    start: samsun,
    end: antalya,
    cities: [samsun, konya, antalya],
  ),
  FlightRoute(
    start: adana,
    end: antalya,
    cities: [adana, mersin, antalya],
  ),
  FlightRoute(
    start: van,
    end: ankara,
    cities: [van, sivas, ankara],
  ),
];
