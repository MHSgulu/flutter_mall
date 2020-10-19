import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/mall_homepage_route.dart';
import 'package:mall/ui/product_classification_route.dart';
import 'package:mall/ui/shop_live.dart';
import 'package:mall/ui/shopping_cart_route.dart';
import 'package:mall/ui/my/user_center_route.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '莱斯购',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          minWidth: 40,
        ),
      ),
      home: WillPopScopeHome(),
    );
  }
}

class WillPopScopeHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WillPopScopeHomeState();
}

class WillPopScopeHomeState extends State<WillPopScopeHome> {
  DateTime _lastClickTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: MyHomePage(),
        onWillPop: () async {
          if (_lastClickTime == null ||
              DateTime.now().difference(_lastClickTime) >
                  Duration(seconds: 1)) {
            Fluttertoast.showToast(msg: '再点一次即可退出');
            _lastClickTime = DateTime.now();
            return false;
          } else {
            return true;
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MallHomepageRoute(),
    ProductClassificationRoute(),
    ShopLiveRoute(),
    ShoppingCartRoute(),
    UserCenterRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black38,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_home.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/icon_home_fill.png'),
            ),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_classify.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/icon_classify_fill.png'),
            ),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_record.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/icon_record_fill.png'),
            ),
            title: Text('直播'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_cart.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/icon_cart_fill.png'),
            ),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_my.png'),
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/icons/icon_my_fill.png'),
            ),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
