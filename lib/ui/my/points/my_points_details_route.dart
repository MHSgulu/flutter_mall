import 'package:flutter/material.dart';
import 'package:mall/ui/my/points/type/all_points_details_list.dart';
import 'package:mall/ui/my/points/type/get_points_details_list.dart';
import 'package:mall/ui/my/points/type/spend_points_details_list.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class MyPointsDetailsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyPointsDetailsRouteState();
}

class MyPointsDetailsRouteState extends State<MyPointsDetailsRoute> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '全部',),
    Tab(text: '获取',),
    Tab(text: '消费',),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            '积分明细',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          centerTitle: true,
          elevation: 0.5,
          bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 0,
                ),
                SizedBox(
                  height: 40,
                  child: TabBar(
                    tabs: myTabs,
                    indicatorColor: Colors.redAccent[700],
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.redAccent[700],
                    unselectedLabelColor: Colors.black54,
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(35),
          ),
        ),
        body: ScrollConfiguration(
            behavior: CustomScrollBehavior(false, false, null),
            child: TabBarView(
              children: [
                AllPointsDetailsList(),
                GetPointsDetailsList(),
                SpendPointsDetailsList(),
              ],
            )
        ),
      ),
    );
  }
}
