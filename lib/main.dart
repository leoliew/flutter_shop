import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'provide/child_category.dart';
import 'provide/category_goods_list.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/routers/routers.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 初始化路由配置
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
          title: '百姓生活+',
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}
