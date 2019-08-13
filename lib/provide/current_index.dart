import 'package:flutter/material.dart';

// 首页底部导航索引值
class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
