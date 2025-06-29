import 'package:ar_beta/log/service/logManager.dart';
import 'package:flutter/material.dart';


class LogView extends StatelessWidget {
  const LogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
      valueListenable: LogManager().logs,
      builder: (context, logs, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.black87,
            title: Text("Log Kayıtları",style: TextStyle(color: Colors.white),),),
          body: SingleChildScrollView(
            scrollDirection:Axis.horizontal,
            child: Container(
               width: (1000),
              color: Colors.black87, // arka plan rengi
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      decoration: BoxDecoration(
                                            color: Colors.black,
            
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text((index+1).toString()+"-",style: TextStyle(color: Colors.white),),
                          Text(
                            logs[index],
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
