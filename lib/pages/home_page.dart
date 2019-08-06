import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_ method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              var data = json.decode(snapshop.data.toString());
              List<Map> swiper = (data['data']['slides'] as List).cast();
              String advertesPicture =  data['data']['advertesPicture']['PICTURE_ADDRESS']; // 广告图片
              List<Map> navigatorList =
                  (data['data']['category'] as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  TopNavigator(navigatorList: navigatorList),
                  AdBanner(advertesPicture:advertesPicture),
                ],
              );
            } else {
              return Center(
                child: Text('加载中.....'),
              );
            }
          },
        ));
  }
}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Container(
      height: ScreenUtil().setHeight(333),
//      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${swiperDataList[index]['image']}",
            fit: BoxFit.fitWidth,
          );
        },
        itemCount: swiperDataList.length,
        // 显示底下的点
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 首页导航区域
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _girdViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.navigatorList.length > 10) {
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _girdViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

// 广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(advertesPicture),
      ],
    );
  }
}
