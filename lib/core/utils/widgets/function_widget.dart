import 'package:flutter/material.dart';

class FunctionWidget {
  static List<Map<String, dynamic>> iconButtonsConfig = getIconButtonsConfig();
  static List<Map<String, dynamic>> getIconButtonsConfig() {
    return [
      {
        'size': 50.0,
        'borderRadius': 10.0,
        'text': 'All',
        'gradientColors': [const Color(0xFF353F54), const Color(0xFF222834)],
      },
      {
        'size': 50.0,
        'borderRadius': 10.0,
        'image': 'assets/icons/bolt.batteryblock.fill.png',
        'gradientColors': [const Color(0xFF353F54), const Color(0xFF222834)],
      },
      {
        'size': 50.0,
        'borderRadius': 10.0,
        'image': 'assets/icons/Road.png',
        'gradientColors': [const Color(0xFF353F54), const Color(0xFF222834)],
      },
      {
        'size': 50.0,
        'borderRadius': 10.0,
        'image': 'assets/icons/t.png',
        'gradientColors': [const Color(0xFF353F54), const Color(0xFF222834)],
      },
      {
        'size': 50.0,
        'borderRadius': 10.0,
        'image': 'assets/icons/Vector.png',
        'gradientColors': [const Color(0xFF353F54), const Color(0xFF222834)],
      },
    ];
  }

  static double getCircleSize(int index, int currentIndex) {
    if (index <= currentIndex) {
      return 9.0;
    } else {
      2.0 * (index - currentIndex);
    }
    return 4;
  }
}
