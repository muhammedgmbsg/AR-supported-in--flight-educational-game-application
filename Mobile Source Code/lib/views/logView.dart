import 'package:ar_beta/controllers/theme_controller.dart';
import 'package:ar_beta/log/service/logManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogView extends StatelessWidget {
  const LogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final logManager = LogManager();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Loglar', style: TextStyle(color: themeController.textColor)),
        backgroundColor: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: themeController.textColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeController.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ValueListenableBuilder<List<String>>(
          valueListenable: logManager.logs,
          builder: (context, logs, child) {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return Card(
                  color: themeController.isDarkMode.value ? Colors.black54 : Colors.white,
                  child: ListTile(
                    title: Text(
                      log,
                      style: TextStyle(
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
} 