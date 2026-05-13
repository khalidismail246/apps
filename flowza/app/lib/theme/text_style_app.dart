import 'package:flutter/material.dart';

abstract class TextStyleApp {
  static TextStyle bold40(Color color) {
    return TextStyle(
      color: color,
      fontSize: 40,
      fontWeight: FontWeight.w800,
      fontFamily: "PlayfairDisplay",
    );
  }

  static TextStyle extraBold24(Color color) {
    return TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      fontFamily: "PlayfairDisplay",
      letterSpacing: 1,
    );
  }

  static TextStyle medium16(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "PlayfairDisplay",
      letterSpacing: 1,
    );
  }

  static TextStyle bold18(Color color) {
    return TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: "PlayfairDisplay",
      letterSpacing: 1,
    );
  }

  static TextStyle light16(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontFamily: "PlayfairDisplay",
    );
  }

  static TextStyle bold12(Color color) {
    return TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    );
  }

  static TextStyle bold15(Color color) {
    return TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    );
  }

  static TextStyle boldItalic20(Color color) {
    return TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: "PlayfairDisplay",
      letterSpacing: 1,
      fontStyle: FontStyle.italic,
    );
  }
}
