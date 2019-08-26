import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category.dart';

// ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int categoryIndex = 0; //大类索引
  int childIndex = 0; // 子类高亮索引
  String categoryId = '4'; //大类id
  String subId = ''; // 小类id
  int page = 1; // 当前页数
  String noMoreText = ''; // 显示没有数据的文字

  //首页点击类别是更改类别
  changeCategory(String id, int index) {
    categoryId = id;
    categoryIndex = index;
    subId = '';
    notifyListeners();
  }

  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list, String id) {
    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(int index, String id) {
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  // 增加 page 的方法
  addPage() {
    page++;
  }

  // 改变noMore 文字
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
