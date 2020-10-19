import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/values/colors.dart';

class MessageCenterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageCenterRouteState();
}

class MessageCenterRouteState extends State<MessageCenterRoute> {
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
          '消息中心',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListTile(
              leading: Image.asset(
                'assets/icons/icon_h_10.png',
                width: 45,
                height: 45,
              ),
              title: Text('物流'),
              subtitle: Text('暂无消息',style: TextStyle(fontSize: 12),),
              onTap: () {
                Fluttertoast.showToast(msg: '暂无物流消息');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: ListTile(
              leading: Image.asset(
                'assets/icons/icon_h_9.png',
                width: 45,
                height: 45,
              ),
              title: Text('通知'),
              subtitle: Text('暂无消息',style: TextStyle(fontSize: 12),),
              onTap: () {
                Fluttertoast.showToast(msg: '暂无通知消息');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: ListTile(
              leading: Image.asset(
                'assets/icons/icon_h_5.png',
                width: 45,
                height: 45,
              ),
              title: Text('活动'),
              subtitle: Text('暂无消息',style: TextStyle(fontSize: 12),),
              onTap: () {
                Fluttertoast.showToast(msg: '暂无活动消息');
              },
            ),
          ),
        ],
      ),
    );
  }
}
