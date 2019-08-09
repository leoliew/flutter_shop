import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类高亮索引

  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list) {
    childIndex = 0;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引

  changeChildIndex(int index){
    childIndex = index;
    notifyListeners();
  }
}
