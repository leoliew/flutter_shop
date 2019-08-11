import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/pages/details_page/details_top_area.dart';
import 'package:flutter_shop/pages/details_page/details_explain.dart';
import 'package:flutter_shop/pages/details_page/details_tab_bar.dart';
import 'package:flutter_shop/pages/details_page/details_web.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;

  DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('商品详细页'),
      ),
      body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: ListView(
                  children: <Widget>[
                    DetailsTopArea(),
                    DetailsExplain(),
                    DetailsTabBar(),
                    DetailWeb(),
                  ],
                ),
              );
            } else {
              return Text('加载中');
            }
          }),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}
