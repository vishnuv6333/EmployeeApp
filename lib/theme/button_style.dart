import 'package:flutter/material.dart';

class CustomButtonStyles {
    static ButtonStyle get fillBlue => ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      );
}