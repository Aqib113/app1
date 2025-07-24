import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  Padding SettingTile(String title, String NextRoute) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          )
          ),
          
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(72, 158, 158, 158),
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dark Theme Option
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 234, 234),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Dark Theme",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // OTHER REMAINING OPTIONS
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
