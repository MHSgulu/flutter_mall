import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mall/values/colors.dart';



class BusinessSettlementRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BusinessSettlementRouteState();

}

class BusinessSettlementRouteState extends State<BusinessSettlementRoute>{

  bool _isExpanded = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  File _image;
  final picker = ImagePicker();

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              '请选择获取的图片方式',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        getImage(1);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/icon_camera.png',
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              '相机',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        getImage(2);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/icon_gallery.png',
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              '图库',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future getImage(int type) async {
    if(type == 1){
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(pickedFile.path);
      });
    }else if(type == 2){
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile.path);
      });
    }

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
          '入驻信息',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (panelIndex,isExpanded){
                setState(() {
                  _isExpanded = ! isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                    headerBuilder: (context,isExpanded){
                      return Container(
                        margin: EdgeInsets.fromLTRB(16, 12, 0, 0),
                        child: Text('基本信息',style: TextStyle(fontSize: 15),),
                      );
                    },
                  isExpanded: _isExpanded,
                    body: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Row(
                            children: <Widget>[
                              Text('店铺名称：'),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '请填写店铺名称(必填)',
                                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 8,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Row(
                            children: <Widget>[
                              Text('店主姓名：'),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '请填写负责店铺的联系人名称(必填)',
                                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 8,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Row(
                            children: <Widget>[
                              Text('店主号码：'),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '请填写负责店铺的联系人手机号码(必填)',
                                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 8,),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: Row(
                            children: <Widget>[
                              Text('详细地址：'),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '请填写店铺的具体位置(必填)',
                                    hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Divider(height: 8,),
                      ],
                    ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex,isExpanded){
                setState(() {
                  _isExpanded2 = ! isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (context,isExpanded){
                    return Container(
                      margin: EdgeInsets.fromLTRB(16, 12, 0, 0),
                      child: Text('证照信息',style: TextStyle(fontSize: 15),),
                    );
                  },
                  isExpanded: _isExpanded2,
                  body: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _showDialog();
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/icons/icon_add_photo.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    Padding(padding: EdgeInsets.only(bottom: 4)),
                                    Text(
                                      '上传执照',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 24)),
                            _image == null
                                ? Container()
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.file(
                                _image,
                                width: 150,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 24, 12, 8),
                        child: Row(
                          children: <Widget>[
                            Text('营业执照注册号：'),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请与营业执照保持一致(必填)',
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Divider(height: 8,),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex,isExpanded){
                setState(() {
                  _isExpanded3 = ! isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (context,isExpanded){
                    return Container(
                      margin: EdgeInsets.fromLTRB(16, 12, 0, 0),
                      child: Text('结算信息',style: TextStyle(fontSize: 15),),
                    );
                  },
                  isExpanded: _isExpanded3,
                  body: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          children: <Widget>[
                            Text('银行卡开户名：'),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写银行卡的开户名(必填)',
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          children: <Widget>[
                            Text('开户人身份证号：'),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写开户人身份证号(必填)',
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          children: <Widget>[
                            Text('开户银行支行名：'),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写开户银行支行的名称(必填)',
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 8,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Row(
                          children: <Widget>[
                            Text('结算银行卡号：'),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写银行卡的卡号(必填)',
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Divider(height: 8,),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
            ),
          ],
        ),
      ),
    );
  }


}