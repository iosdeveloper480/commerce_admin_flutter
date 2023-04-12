import 'package:flutter/material.dart';

class WATheme {
  static ButtonStyle styleFrom(
    Color backgroundColor,
    Color shadowColor,
    double borderRadius,
  ) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      splashFactory: NoSplash.splashFactory,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: const BorderSide(color: Colors.transparent),
      ),
    );
  }
}
