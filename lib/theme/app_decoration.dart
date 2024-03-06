import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack9004 => const BoxDecoration(
      color: Color.fromARGB(255, 180, 202, 220),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)));
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          //BoxShadow
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            spreadRadius: 0.3,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(19),
      );
}
