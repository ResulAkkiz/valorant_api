import 'package:flutter/material.dart';
import 'package:valorant_api/model/agents_model.dart';

class UIHelper {
  static Color valorantColor = const Color.fromARGB(255, 250, 68, 84);
  static Color backColor = const Color.fromARGB(255, 48, 48, 48);

  static String getCategory(String? text) {
    List<String> category = text!.split('::');
    return category.last;
  }

  static List<Color> getBackColorList(Agent agents) {
    List<Color> colors = [];
    if (agents.backgroundGradientColors != null) {
      for (int i = 0; i < agents.backgroundGradientColors!.length; i++) {
        colors.add(
          Color(
            int.parse('0x${agents.backgroundGradientColors![i]}'),
          ),
        );
      }
    } else {
      colors = const [
        Color(0x58394dff),
        Color(0x58394dff),
        Color(0x58394dff),
        Color(0x58394dff)
      ];
    }
    return colors;
  }

  static Color getColorByAgent(String agentName) {
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
