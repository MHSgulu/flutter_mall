import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/my/account/my_account_route.dart';
import 'package:mall/ui/my/address/shipping_address_list_route.dart';
import 'package:mall/ui/my/comments/my_comments.dart';
import 'package:mall/ui/my/coupon/my_coupon_route.dart';
import 'package:mall/ui/my/message/message_center_route.dart';
import 'package:mall/ui/my/my_browsing_history_route.dart';
import 'package:mall/ui/my/order/Refund_and_after_sales_route.dart';
import 'package:mall/ui/my/order/my_order_list_route.dart';
import 'package:mall/ui/my/points/my_points_details_route.dart';
import 'package:mall/ui/shop/business_settlement_route.dart';
import 'package:mall/util/constant.dart';
import 'package:mall/util/custom_scroll_behavior.dart';

class UserCenterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserCenterRouteState();
}

class UserCenterRouteState extends State<UserCenterRoute> {
  void jumpToOrderList(int index) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyOrderListRoute(
                    initIndex: 1,
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyOrderListRoute(
                    initIndex: 2,
                  )));
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyOrderListRoute(
                    initIndex: 3,
                  )));
    } else if (index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyOrderListRoute(
                    initIndex: 4,
                  )));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RefundAndAfterSalesRoute()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(true, false, Colors.blueAccent),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: Container(
            color: Color(0xFFF5F5F5),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/img_user_banner.jpg'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                            child: ClipOval(
                                child: Image.network(
                                  'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 12)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
                                child: Text(
                                  '18866669999',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 14),
                                ),
                              ),
                              Text('黄金会员',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            icon: Icon(Icons.mail),
                            color: Colors.white70,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => MessageCenterRoute()));
                            },
                          ),
                          //Padding(padding: EdgeInsets.only(right: 24)),
                          IconButton(
                              icon: Icon(Icons.settings),
                              color: Colors.white70,
                              onPressed: (){
                                Fluttertoast.showToast(msg: '设置');
                              },
                          ),
                          //Padding(padding: EdgeInsets.only(right: 12)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => MyAccountRoute()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '0.00',
                                    style: TextStyle(
                                        color: Colors.deepOrange, fontSize: 16),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 2)),
                                  Text(
                                    '余额',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 0.8,
                              height: 20,
                              color: Colors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => MyPointsDetailsRoute()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '200',
                                    style: TextStyle(
                                        color: Colors.deepOrange, fontSize: 16),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 2)),
                                  Text(
                                    '积分',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 0.8,
                              height: 20,
                              color: Colors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => MyCouponRoute()));
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.deepOrange, fontSize: 16),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 2)),
                                  Text(
                                    '优惠券',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 16, 12, 0),
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Text('我的订单'),
                                Expanded(child: Container()),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyOrderListRoute(
                                                  initIndex: 0,
                                                )));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '全部订单',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 4)),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 8)),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 6)),
                            Divider(
                              height: 0,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                childAspectRatio: 1.2,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    jumpToOrderList(index);
                                  },
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          Constant.orderIconList[index],
                                          width: 30,
                                          height: 30,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 2, 0, 2)),
                                        Text(
                                          Constant.orderTitleList[index],
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 16, 12, 0),
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Text('常用功能'),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 6)),
                            Divider(),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1.1,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyCommentsRoute()));
                                    } else if (index == 7) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyBrowsingHistoryRoute()));
                                    } else if (index == 8) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyShippingAddressListRoute()));
                                    } else if (index == 9) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessSettlementRoute()));
                                    }
                                    else {
                                      Fluttertoast.showToast(msg: Constant.myTitleList[index]);
                                    }
                                  },
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          Constant.myIconList[index],
                                          width: 30,
                                          height: 30,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 4)),
                                        Text(
                                          Constant.myTitleList[index],
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
