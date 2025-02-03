import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSettingCard(
              "Configurer les paramètres de l'application", "Work in progress"),
          SizedBox(height: 10),
          _buildSettingCard("Param2", "Work in progress"),
        ],
      ),
    );
  }
}

Widget _buildSettingCard(String title, String subtitle) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}
