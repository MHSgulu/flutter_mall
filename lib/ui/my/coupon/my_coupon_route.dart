import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';



class MyCouponRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyCouponRouteState();

}

class MyCouponRouteState extends State<MyCouponRoute>{
  final List<Tab> myTabs = <Tab>[
    Tab(text: '未使用',),
    Tab(text: '已使用',),
    Tab(text: '已过期/失效',),
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
              '我的优惠券',
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
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Image.asset('assets/icons/icon_coupon.png',width: 100,height: 100,),
                        Text('暂无优惠券',style: TextStyle(color: Colors.black54,fontSize: 13),),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        RaisedButton(
                          onPressed: (){
                            Fluttertoast.showToast(msg: '前往领券中心');
                          },
                          textColor: Colors.white,
                          color: Colors.redAccent[700],
                          child: Text('前往领券中心'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Image.asset('assets/icons/icon_coupon.png',width: 100,height: 100,),
                        Text('暂无优惠券',style: TextStyle(color: Colors.black54,fontSize: 13),),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        RaisedButton(
                          onPressed: (){
                            Fluttertoast.showToast(msg: '前往领券中心');
                          },
                          textColor: Colors.white,
                          color: Colors.redAccent[700],
                          child: Text('前往领券中心'),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(bottom: 50)),
                        Image.asset('assets/icons/icon_coupon.png',width: 100,height: 100,),
                        Text('暂无优惠券',style: TextStyle(color: Colors.black54,fontSize: 13),),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        RaisedButton(
                          onPressed: (){
                            Fluttertoast.showToast(msg: '前往领券中心');
                          },
                          textColor: Colors.white,
                          color: Colors.redAccent[700],
                          child: Text('前往领券中心'),
                        ),
                      ],
                    ),
                  ]
              ),
          ),
        ),
    );
  }


}

