# AirJet Kids

## Repository Notes

1. **Documentation, Introduction & Reports:** Includes promotional videos, project presentations, and documentation files.  
2. **Mobile Application Source Code:** Contains the initial source code of the AirJet Kids mobile app.  
3. **Website Source Code:** Includes the source code for the AirJet Kids website.  
4. **Mobile App Beta APK:** Beta version APK for testing the app on real devices.  
5. **Final Project Source Code:** The most up-to-date and completed source code of the AirJet Kids mobile application.  
6. **Final Project APK:** Latest APK file with all final features for real device testing.

---

## Project Introduction

An interactive mobile application developed using technologies like Augmented Reality to ensure children have an educational and entertaining flight experience. It allows users to draw flight routes between cities on a map of Turkey. At each stop, children can play AR-enhanced memory card games and age-based word puzzle games with scoring systems, timers, and hints.

---

## Website  
🔗 [https://airjetkids.github.io/](https://airjetkids.github.io/)

---

## Development Team & Roles

- **Team Leader: Muhammed Fethi GÜMÜŞBOĞA**  
  Flutter UI development, Dart-based route modeling, map & UI design, AR integration & 3D model management, GetX game logic, and scoring system implementation.

- **Team Member: Nurettin Mutlu TÜVER**  
  Data models & JSON setup, AR scene creation, brand website development, documentation & presentation preparation.

---

## Trello Board  
🔗 [https://trello.com/b/frMMlU0m/airjet-kids](https://trello.com/b/frMMlU0m/airjet-kids)

---

## Mobile App Code Structure

- **`lib/main.dart`** – App entry point, initializes `GetStorage`, loads `RouteSelectionScreen`.  
- **`lib/homeScreen.dart`** – Allows users to select departure/destination cities.  
- **`lib/routeScreen.dart`** – Displays the selected route on Turkey’s map with plane/city icons.  
- **`lib/cityDetailsScreen.dart`** – Shows AR model preview and a button to start the game.  
- **`lib/r.dart`** – Uses `ar_flutter_plugin` to render a GLTF model in the AR scene.  
- **`lib/gameOnboard.dart`** – Displays puzzle rules and leads to game start.  
- **`lib/gameStartScreen.dart`** – Shows leaderboard and game options.  
- **`lib/gameScreen.dart`** – Main puzzle gameplay screen (timer, score, hints, etc.).  
- **`lib/puzzleController.dart`** – GetX controller handling game logic, timer, scoring.  
- **`lib/awartWidget.dart`** – PageView widget to show top scoring users.  
- **`lib/awart.dart`** – Data model for storing user and score.  
- **`lib/city.dart`** – Defines metadata for cities (AR model, coordinates, hints).  
- **`lib/flightRoute.dart`** – Model for flight routes including stops.  
- **`lib/logManager.dart`** – Stores in-app logs.  
- **`lib/logScreen.dart`** – Displays log records in a scrollable list.

---

## Requirements

- **Flutter SDK (≥ 2.10)**  
- **Android Studio or Xcode**  
- **Real device required** for AR experience  
- **ARCore-supported Android device required**  
- 🔗 [Supported ARCore Devices](https://developers.google.com/ar/devices?hl=en)

---

## Beta Version Notes

- Limited available routes (e.g., Elazığ–Istanbul, Izmir–Bursa)  
- AR technology integration completed (scenes not yet ready)  
- Initial infrastructure for user-based scoring system created

---

## Final Version Notes

1. **Added possible flight routes across Turkey**  
2. **AR memory card game for each city implemented**  
3. **Word puzzle data added for 81 cities, categorized by user age**  
4. **User registration and login functionality added**  
5. **City-based scoring system for all games implemented**  
6. **Firebase leaderboard system showing top users globally**  
7. **Mandatory break screen every 20 minutes for eye health protection**  
8. **SHA-256 encryption for personal data stored in Firebase**  
9. **Logging infrastructure added for alpha, beta, and gamma testing**  
10. **Tutorial screens included for each game and scoring system explanation**

---

## Installation & Run

```bash
# Clone the repository
git clone <REPO_URL>
cd <PROJECT_FOLDER>

# Get dependencies
flutter pub get

# Launch the app
flutter run
Videos & Downloads
Full Project Introduction Video:
🔗 https://youtu.be/xSlaiuqp3Vk

Latest App Demo Video:
🔗 https://youtu.be/tE-3dke8MOY

Download Latest APK:
🔗 Click here

Project Presentation File:
🔗 Click here

Final Version Presentation PDF:
🔗 Click here
