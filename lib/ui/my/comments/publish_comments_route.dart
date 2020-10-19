import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mall/util/custom_scroll_behavior.dart';

class PublishCommentsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PublishCommentsRouteState();
}

class PublishCommentsRouteState extends State<PublishCommentsRoute> {
  double _rating = 0;
  double _rating2 = 0;
  double _rating3 = 0;

  List<String> imgList = [
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  List<File> fileList = List();

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
        fileList.add(_image);
      });
    }else if(type == 2){
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile.path);
        fileList.add(_image);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F4F4),
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
          '发表评价',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: commentsContentView(),
      bottomNavigationBar: bottomButton(),
    );
  }

  Widget commentsContentView() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(false, false, null),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 12, 10, 16),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '女装2020年秋季新款大码洋气显瘦马甲两件套装胖妹妹mm减龄连衣裙',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 4)),
                            Text(
                              '颜色：白色；长裙；S码',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  Row(
                    children: <Widget>[
                      Text(
                        '描述相符',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.only(right: 16)),
                      RatingBar(
                        itemSize: 22.5,
                        itemPadding: EdgeInsets.only(right: 8),
                        ratingWidget: RatingWidget(
                          full:
                          Image.asset('assets/icons/icon_star_fill.png'),
                          empty:
                          Image.asset('assets/icons/icon_star_empty.png'),
                          half:
                          Image.asset('assets/icons/icon_star_fill.png'),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Text(
                        _rating == 0
                            ? ''
                            : _rating == 1
                            ? '非常差'
                            : _rating == 2
                            ? '差'
                            : _rating == 3
                            ? '一般'
                            : _rating == 4 ? '好' : '非常好',
                        style: TextStyle(color: Colors.black38, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: TextField(
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                      cursorColor: Colors.deepOrangeAccent,
                      maxLength: 120,
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '体验如何？快来分享吧',
                        hintStyle:
                        TextStyle(color: Colors.black45, fontSize: 13),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (fileList.length >= 6) {
                            Fluttertoast.showToast(msg: '最多支持发布6张图片哦');
                          } else {
                            _showDialog();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          color: Color(0xFFFAFAFA),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/icons/icon_add_photo.png',
                                width: 25,
                                height: 25,
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 4)),
                              Text(
                                '添加图片',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 75,
                          child: ListView.builder(
                            itemCount: fileList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.file(
                                        fileList[index],
                                        width: 75,
                                        height: 75,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Fluttertoast.showToast(
                                              msg: '当前图片已撤销');
                                          fileList.removeAt(index);
                                        });
                                      },
                                      child: ClipOval(
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          color: Colors.black45,
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 16),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('那可是家旗舰店'),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  Row(
                    children: <Widget>[
                      Text(
                        '物流服务',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.only(right: 16)),
                      RatingBar(
                        itemSize: 22.5,
                        itemPadding: EdgeInsets.only(right: 8),
                        ratingWidget: RatingWidget(
                          full:
                          Image.asset('assets/icons/icon_star_fill.png'),
                          empty:
                          Image.asset('assets/icons/icon_star_empty.png'),
                          half:
                          Image.asset('assets/icons/icon_star_fill.png'),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating2 = rating;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Text(
                        _rating2 == 0
                            ? ''
                            : _rating2 == 1
                            ? '非常差'
                            : _rating2 == 2
                            ? '差'
                            : _rating2 == 3
                            ? '一般'
                            : _rating2 == 4 ? '好' : '非常好',
                        style:
                        TextStyle(color: Colors.deepOrange, fontSize: 13),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    children: <Widget>[
                      Text(
                        '服务态度',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.only(right: 16)),
                      RatingBar(
                        itemSize: 22.5,
                        itemPadding: EdgeInsets.only(right: 8),
                        ratingWidget: RatingWidget(
                          full:
                          Image.asset('assets/icons/icon_star_fill.png'),
                          empty:
                          Image.asset('assets/icons/icon_star_empty.png'),
                          half:
                          Image.asset('assets/icons/icon_star_fill.png'),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating3 = rating;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Text(
                        _rating3 == 0
                            ? ''
                            : _rating3 == 1
                            ? '非常差'
                            : _rating3 == 2
                            ? '差'
                            : _rating3 == 3
                            ? '一般'
                            : _rating3 == 4 ? '好' : '非常好',
                        style:
                        TextStyle(color: Colors.deepOrange, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: RaisedButton(
        onPressed: () {
          Fluttertoast.showToast(msg: '确认发布');
        },
        color: Colors.redAccent,
        textColor: Colors.white,
        child: Text('确认发布'),
      ),
    );
  }

}
