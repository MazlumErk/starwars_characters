import 'package:flutter/material.dart';

class BoxDecorations {
  static BoxDecoration characterCardBoxDecoration = BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.yellow,
        blurRadius: 55,
        offset: Offset(0, 0),
        spreadRadius: 0,
      ),
    ],
  );
}
