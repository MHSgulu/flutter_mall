import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/products/product_comments.dart';
import 'package:mall/ui/shop/chat/contact_customer_service_route.dart';
import 'package:mall/ui/shop/detail/shop_details_route.dart';
import 'package:mall/util/custom_scroll_behavior.dart';

class ProductsDetailRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductsDetailRouteState();
}

class ProductsDetailRouteState extends State<ProductsDetailRoute> {
  List<String> imgList = [
    'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/1137281293/O1CN01qY8neX1LQEjG4WDl7_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1137281293/O1CN01gsTbXh1LQEj7ZUbLV_!!1137281293.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1057963225/O1CN01PTgWCm1Zh5vnJb1sm_!!1057963225.jpg_250x250.jpg_.webp',
  ];

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    //final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '商品详情',
          style: TextStyle(color: Colors.black87, fontSize: 17),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black87,
            ),
            onPressed: () {
              Fluttertoast.showToast(msg: '更多操作');
            },
          ),
        ],
        elevation: 0.5,
      ),
      body: productDetailsScrollView(),
      bottomNavigationBar: bottomBarView(),
    );
  }

  Widget productDetailsScrollView() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(false, false, null),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Swiper(
                autoplay: true,
                itemBuilder: (context, index) {
                  return Image.network(
                    imgList[index],
                    //width: _width,
                    fit: BoxFit.cover,
                  );
                },
                itemCount: 3,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    size: 5,
                    activeSize: 8,
                    color: Colors.grey,
                    activeColor: Colors.white,
                  ),
                ),
                //control: SwiperControl(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text(
                '欧洲站秋装2020年新款女法式碎花桔梗裙冷淡风两件套装吊带连衣裙秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
                style: TextStyle(
                  fontSize: 15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 16, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    '¥1339',
                    style: TextStyle(color: Colors.redAccent, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  Text(
                    '¥1839',
                    style: TextStyle(
                      color: Colors.black54,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '销量: 12',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    '规格',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  Text('单人沙发 / 米白色'),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  ),
                ],
              ),
            ),*/
            Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    '优惠',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  Text('满99元减9元'),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    '服务',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  Text('极速退款 | 全场包邮 | 48小时发货'),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    '参数',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  Text('品牌、产地、保质期'),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductCommentsRoute()));
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      '用户评价(568)',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Padding(padding: EdgeInsets.only(right: 12)),
                    Expanded(child: Container()),
                    Text(
                      '查看全部',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    Padding(padding: EdgeInsets.only(right: 12)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/1137281293/O1CN01qY8neX1LQEjG4WDl7_!!0-item_pic.jpg_250x250.jpg_.webp',
                      width: 50,
                      height: 50,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  Padding(padding: EdgeInsets.only(right: 12)),
                  Text('少女初心专卖店'),
                  Expanded(child: Container()),
                  SizedBox(
                    height: 30,
                    child: RaisedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ShopDetailsRoute())),
                      //shape: StadiumBorder(),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFE6C1B),
                              Color(0xFFF73F34),
                            ],
                          ),
                        ),
                        child: Text(
                          '进店逛逛',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '商品描述 4.8',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    '商家服务 4.9',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    '物流服务 4.6',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 16, 12, 8),
              child: Center(
                child: Text(
                  '商品详情',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Center(
                child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600688871187&di=37ff3f52af07d622d8bc44d309884bee&imgtype=0&src=http%3A%2F%2Fpic36.photophoto.cn%2F20150813%2F0030014547237282_b.jpg',
                  //width: _width,
                  //fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBarView() {
    return Container(
      height: 50,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Divider(
            height: 0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ShopDetailsRoute())),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/icon_pd_2.png',
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            '店铺',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ContactCustomerServiceRoute())),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/icon_pd_3.png',
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            '客服',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => favorProduct(),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            _isFavorite
                                ? 'assets/icons/icon_favor_fill.png'
                                : 'assets/icons/icon_pd_1.png',
                            width: 20,
                            height: 20,
                          ),
                          Text(
                            '收藏',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: '添加成功');
                },
                child: Container(
                  height: 50,
                  color: Colors.teal,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Center(
                    child: Text(
                      '加入购物车',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: '立即购买');
                },
                child: Container(
                  height: 50,
                  color: Colors.deepOrange,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Center(
                    child: Text(
                      '立即购买',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void favorProduct() {
    if (_isFavorite) {
      Fluttertoast.showToast(msg: '取消商品收藏成功');
      if (mounted) {
        setState(() {
          _isFavorite = false;
        });
      }
    } else {
      Fluttertoast.showToast(msg: '商品收藏成功');
      if (mounted) {
        setState(() {
          _isFavorite = true;
        });
      }
    }
  }
}
