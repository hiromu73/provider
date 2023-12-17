import 'package:flutter/material.dart';
class CountModel extends ChangeNotifier{
  int count = 0;
  int count2 = 0;

  void incrementCounter() {
    count++;
    count2--;
    notifyListeners();
  }
}