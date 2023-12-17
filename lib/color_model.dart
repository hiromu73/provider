import 'dart:math';

import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier{
  Color currentColor = Colors.black;

  void changeColor() {
    // ランダムで色を返す。
    currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0,).withOpacity(1.0);
    notifyListeners();
  }
}