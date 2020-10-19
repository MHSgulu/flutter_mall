import 'package:flutter/material.dart';
import 'package:mall/ui/shop/chat/contact_customer_service_route.dart';
import 'package:mall/ui/shop/detail/all_goods_route.dart';
import 'package:mall/ui/shop/detail/classification_shop_goods_route.dart';



class ShopDetailsRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ShopDetailsRouteState();

}

class ShopDetailsRouteState extends State<ShopDetailsRoute>{
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    //Center(child: Text('1'),),
    AllGoodsRoute(),
    ClassificationShopGoodsRoute(),
    Container(),
  ];

  List<BottomNavigationBarItem> _itemList = [
    /*BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_shop1.png'),
      ),
      activeIcon: ImageIcon(
        AssetImage('assets/icons/icon_shop1_fill.png'),
      ),
      title: Text('店铺首页'),
    ),*/
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_shop2.png'),
      ),
      activeIcon: ImageIcon(
        AssetImage('assets/icons/icon_shop2_fill.png'),
      ),
      title: Text('全部商品'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_shop3.png'),
      ),
      activeIcon: ImageIcon(
        AssetImage('assets/icons/icon_shop3.png'),
      ),
      title: Text('商品分类'),
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/icon_shop4.png'),
      ),
      activeIcon: ImageIcon(
        AssetImage('assets/icons/icon_shop4_fill.png'),
      ),
      title: Text('联系客服'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black38,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (value) {
          if(value == 2){
            Navigator.push(context, MaterialPageRoute(builder: (_) => ContactCustomerServiceRoute()));
          }else{
            setState(() {
              _currentIndex = value;
            });
          }
        },
        items: _itemList,
      ),
    );
  }


}