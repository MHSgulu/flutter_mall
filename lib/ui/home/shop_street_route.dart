import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/shop/detail/shop_details_route.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class ShopStreetRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopStreetRouteState();
}

class ShopStreetRouteState extends State<ShopStreetRoute> {
  List<String> shopCoverList = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://gd4.alicdn.com/imgextra/i4/1699627866/O1CN01RcVus927yg4a6UNju_!!1699627866.jpg_400x400.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          '店铺街',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ScrollConfiguration(
          behavior: CustomScrollBehavior(false, false, null),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    //Fluttertoast.showToast(msg: '$index');
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ShopDetailsRoute()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 16),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  shopCoverList[index],
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 12)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '爱我你怕么自营店',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 4)),
                                  Text(
                                    '2人已关注',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 12),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Container(
                                height: 30,
                                child: OutlineButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(msg: '关注店铺不迷路');
                                  },
                                  textColor: Colors.redAccent,
                                  highlightColor: Colors.transparent,
                                  highlightedBorderColor: Colors.deepOrange,
                                  child: Text('关注', style: TextStyle(fontSize: 12)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              '宝贝描述 4.5 分',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '卖家服务 4.8 分',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '物流速度 4.3 分',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.network(
                                      shopCoverList[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    '范思蓝恩小香风连衣裙秋装2020年新款女七分袖法式复古温柔风裙子',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 4)),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '¥',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 12),
                                      ),
                                      Text(
                                        '25.0',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.network(
                                      shopCoverList[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    '范思蓝恩小香风连衣裙秋装2020年新款女七分袖法式复古温柔风裙子',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 4)),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '¥',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 12),
                                      ),
                                      Text(
                                        '25.0',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.network(
                                      shopCoverList[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    '范思蓝恩小香风连衣裙秋装2020年新款女七分袖法式复古温柔风裙子',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 4)),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '¥',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 12),
                                      ),
                                      Text(
                                        '25.0',
                                        style: TextStyle(
                                            color: Colors.redAccent, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
      )
    );
  }
}
