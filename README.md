# flutter_shop

Flutter 电商小项目.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

## 项目功能
![项目功能](https://raw.githubusercontent.com/leoliew/flutter_shop/master/document/feature.png?token=AA2DVRRMSGL3CNLIGBMES6C5M2VIG)

## 项目结构

```
lib
├── config                  // 项目配置
├── model                   // 数据模型,与API返回数据对应
├── pages                   // 页面
│   ├── cart_page           // 购物车页面拆分目录
│   └── details_page        // 商品详情页面拆分目录
├── provide                 // 状态管理
├── routers                 // 路由
└── service                 // 公共方法
```

## API 文档
[文档地址](https://documenter.getpostman.com/view/363009/SVfKwVR7?version=latest)

## 依赖模块
- dio                       // http请求
- flutter_swiper            // 轮播展示
- flutter_screenutil        // 屏幕适配
- url_launcher              // 唤起url
- flutter_easyrefresh       // 上/下拉加载
- provide                   // 状态管理
- intl                      // 国际化
- fluttertoast              // 轻提示
- fluro                     // 企业级路由
- flutter_html              // html解析
- shared_preferences        // 数据持久化

