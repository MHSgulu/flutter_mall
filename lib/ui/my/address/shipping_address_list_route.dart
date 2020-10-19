import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/my/address/add_shipping_address_route.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class MyShippingAddressListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyShippingAddressListRouteState();
}

class MyShippingAddressListRouteState extends State<MyShippingAddressListRoute> {
  int _value = 0;

  List<String> courierReceiverList = [
    '北大还行撒贝宁',
    '名下无房潘石屹',
    '不知器美刘强东',
    '浦东家庭马化腾',
    '悔创阿力杰克马',
    '一无所有王建林',
  ];

  List<String> courierReceiverAddressList = [
    '北京市朝阳区光华路甲一号院',
    '北京市朝阳区望京街10号',
    '北京市大兴区科创十一街18号院',
    '北京市海淀区西北旺东路10号院西区9号楼',
    '北京市海淀区西北旺东路10号院西区9号楼',
    '北京市朝阳区东三环富尔大厦32层',
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
          '我的收货地址',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ScrollConfiguration(
          behavior: CustomScrollBehavior(false, false, null),
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 20),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(courierReceiverList[index]),
                            Padding(padding: EdgeInsets.only(right: 12)),
                            Text(
                              '1886669999',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 6)),
                        Text(
                          courierReceiverAddressList[index],
                          style: TextStyle(fontSize: 13),
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Radio(
                                value: index,
                                groupValue: _value,
                                onChanged: (int value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                                activeColor: Colors.redAccent,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 6)),
                            Text(
                              _value == index ? '已设置为默认' : '设为默认',
                              style: TextStyle(
                                  color: _value == index
                                      ? Colors.redAccent
                                      : Colors.black54,
                                  fontSize: 13),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(msg: '删除');
                              },
                              child: Text('删除',style: TextStyle(color: Colors.black54)),
                            ),
                            Padding(padding: EdgeInsets.only(right: 24)),
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(msg: '编辑');
                              },
                              child: Text('编辑',style: TextStyle(color: Colors.black54),),
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddShippingAddressRoute()));
          },
          color: Colors.redAccent,
          textColor: Colors.white,
          icon: Icon(Icons.add),
          label: Text('新增收货地址'),
        ),
      ),
    );
  }
}
