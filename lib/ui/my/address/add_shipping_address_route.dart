import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/values/colors.dart';

class AddShippingAddressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddShippingAddressRouteState();
}

class AddShippingAddressRouteState extends State<AddShippingAddressRoute> {
  bool _value = false;

  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _addressController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

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
          '新增收货地址',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(12, 16, 12, 0),
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 42,
              child: Row(
                children: <Widget>[
                  Text(
                    '收件人名：',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Expanded(
                      child: Container(
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入姓名',
                        hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 42,
              child: Row(
                children: <Widget>[
                  Text(
                    '手机号码：',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Expanded(
                      child: Container(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入手机号码',
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: '选择省市区');
              },
              child: Container(
                height: 42,
                child: Row(
                  children: <Widget>[
                    Text(
                      '所在地区：',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      '请选择您的地址',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              height: 42,
              child: Row(
                children: <Widget>[
                  Text(
                    '详细地址：',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Expanded(
                      child: Container(
                    child: TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入您的详细地址',
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 42,
              child: Row(
                children: <Widget>[
                  Text(
                    '设为默认地址',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Expanded(child: Container()),
                  Switch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    activeColor: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: RaisedButton.icon(
          onPressed: () {
            Fluttertoast.showToast(msg: '保存地址');
          },
          color: Colors.redAccent,
          textColor: Colors.white,
          icon: Icon(Icons.save),
          label: Text('保存收货地址'),
        ),
      ),
    );
  }
}
