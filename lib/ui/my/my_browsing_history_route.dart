import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class MyBrowsingHistoryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyBrowsingHistoryRouteState();
}

class MyBrowsingHistoryRouteState extends State<MyBrowsingHistoryRoute> {
  List<String> dateTimeList = [
    '09月09日',
    '09月08日',
    '09月07日',
  ];

  List<String> indexList1 = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
  ];

  List<String> indexList2 = [
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
  ];

  List<String> indexList3 = [
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
          '历史浏览',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ScrollConfiguration(
          behavior: CustomScrollBehavior(false, false, null),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                      child: Text(dateTimeList[index1]),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: index1 == 0 ? 1 : index1 == 1 ? 2 : 3,
                      itemBuilder: (context, index2) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(msg: '第${index1 + 1}个日期的第${index2 + 1}条浏览记录');
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Image.network(
                                      index1 == 0
                                          ? indexList1[index2]
                                          : index1 == 1
                                          ? indexList2[index2]
                                          : indexList3[index2],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(10, 0, 6, 20),
                                            child: Text(
                                              '女装2020年秋季新款大码洋气显瘦马甲两件套装胖妹妹mm减龄连衣裙',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(8, 0, 0, 4),
                                                child: Text('￥59.9',
                                                    style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontSize: 16,
                                                    )),
                                              ),
                                              Expanded(child: Container()),
                                              Padding(
                                                padding: EdgeInsets.only(right: 8),
                                                child: SizedBox(
                                                  //width: 70,
                                                  height: 30,
                                                  child: OutlineButton(
                                                    onPressed: () {
                                                      Fluttertoast.showToast(
                                                          msg: '寻找相似');
                                                    },
                                                    highlightColor: Colors.white12,
                                                    highlightedBorderColor:
                                                    Colors.deepOrangeAccent,
                                                    child: Text(
                                                      '看相似',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                      },
                    ),
                  ],
                );
              },
            ),
          ),
      ),
    );
  }
}
