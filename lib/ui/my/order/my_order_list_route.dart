import 'package:flutter/material.dart';
import 'package:mall/ui/my/order/type/all_order_list.dart';
import 'package:mall/ui/my/order/type/awaiting_delivery_order_list.dart';
import 'package:mall/ui/my/order/type/awaiting_evaluation_order_list.dart';
import 'package:mall/ui/my/order/type/awaiting_payment_order_list.dart';
import 'package:mall/ui/my/order/type/awaiting_shipment_order_list.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class MyOrderListRoute extends StatefulWidget {
  final int initIndex;

  const MyOrderListRoute({Key key, this.initIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyOrderListRouteState();
}

class MyOrderListRouteState extends State<MyOrderListRoute> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '全部',),
    Tab(text: '待付款',),
    Tab(text: '待发货',),
    Tab(text: '待收货',),
    Tab(text: '待评价',),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: widget.initIndex,
      child: Scaffold(
        backgroundColor: MyColors.mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: MyColors.mainBackgroundColor,
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
            '我的订单',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: myTabs,
            isScrollable: true,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black54,
          ),
        ),
        body: ScrollConfiguration(
            behavior: CustomScrollBehavior(false, false, null),
            child: TabBarView(
                children: [
                  AllOrderList(),
                  AwaitingPaymentOrderList(),
                  AwaitingShipmentOrderList(),
                  AwaitingDeliveryOrderList(),
                  AwaitingEvaluationOrderList(),
                ]),
        ),
      ),
    );
  }
}
