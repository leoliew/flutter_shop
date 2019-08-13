import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods_list.dart';

// ChangeNotifier的混入是不用管理听众
class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];

  // 点击大类时，更换商品列表
  getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }

  // 加载更多商品
  getMoreList(List<CategoryListData> list) {
    goodsList.addAll(list);
    notifyListeners();
  }
}
