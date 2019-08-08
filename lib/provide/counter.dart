import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int val = 0;

  increment(){
    val++;
    notifyListeners();
  }

}