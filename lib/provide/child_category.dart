import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];

  getChildCategory(List list) {
    childCategoryList = list;
    notifyListeners();
  }
}
