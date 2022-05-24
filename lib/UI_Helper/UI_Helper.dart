import 'package:flutter/material.dart';
import 'package:valorant_api/Models/Agents.dart';

class UIHelper {
  static Color ValorantColor = const Color.fromARGB(255, 250, 68, 84);
  static Color BackColor = const Color.fromARGB(255, 48, 48, 48);

  static String GetCategory(String? Text) {
    List<String> category = Text!.split('::');
    return category.last;
  }

  static List<Color> getBackColorList(Agents agents) {
    List<Color> Colors = [];
    if (agents.backgroundGradientColors != null) {
      for (int i = 0; i < agents.backgroundGradientColors!.length; i++) {
        Colors.add(
          Color(
            int.parse('0x${agents.backgroundGradientColors![i]}'),
          ),
        );
      }
    } else {
      Colors = const [
        Color(0x58394dff),
        Color(0x58394dff),
        Color(0x58394dff),
        Color(0x58394dff)
      ];
    }
    return Colors;
  }

  static Color GetColorByAgent(String agentName) {
    if (agentName == "Breach" ||
        agentName == "Chamber" ||
        agentName == "Killjoy") {
      return Colors.yellow;
    } else if (agentName == "Phoenix" ||
        agentName == "Brimstone" ||
        agentName == "Raze") {
      return Colors.orange;
    } else if (agentName == "Sage" ||
        agentName == "Skye" ||
        agentName == "Viper") {
      return Colors.green;
    } else if (agentName == "Astra") {
      return Colors.purple;
    } else if (agentName == "Reyna") {
      return Colors.pink;
    } else {
      return Colors.blue;
    }
  }
}
