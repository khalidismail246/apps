import 'package:flutter/material.dart';

abstract class TextStyleApp {
  static TextStyle bold40(Color color) {
    return TextStyle(
      color: color,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      fontFamily: 'Pacifico',
    );
  }

  static TextStyle bold20(Color color) {
    return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle bold16(Color color) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold);
  }

  static TextStyle bold24(Color color) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Pacifico',
    );
  }
}
