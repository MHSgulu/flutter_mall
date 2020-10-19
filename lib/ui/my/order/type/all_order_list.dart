import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AllOrderList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AllOrderListState();

}

class AllOrderListState extends State<AllOrderList>{

  List<String> shopTitleList = [
    '假如有一天我不在的店',
    '好高大上的店',
    '那可是家大的店',
    '十八里铺右边巷子里的店',
  ];

  List<String> orderStatusList = [
    '待付款',
    '待发货',
    '待收货',
    '待评价',
  ];

  List<int> orderStatusValueList = [1,2,3,4];

  List<String> merchandisePictureList = [
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://gd4.alicdn.com/imgextra/i4/1699627866/O1CN01RcVus927yg4a6UNju_!!1699627866.jpg_400x400.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  List<String> merchandiseTitleList = [
    '女装2020年秋季新款大码洋气显瘦马甲两件套装胖妹妹mm减龄连衣裙',
    '太平鸟小黑裙翻领短袖收腰镂空性感连衣裙女2020夏季新款小香风',
    'Gloria/歌莉娅2020显瘦西装领小香风黑色A字型连衣裙108R4G820',
    '范思蓝恩小香风连衣裙秋装2020年新款女七分袖法式复古温柔风裙子',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: '查看订单详情');
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Fluttertoast.showToast(msg: '${shopTitleList[index]}');
                          },
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/icons/icon_shop.png',
                                width: 20,
                                height: 20,
                              ),
                              Padding(padding: EdgeInsets.only(right: 8)),
                              Text(shopTitleList[index], style: TextStyle(fontSize: 15)),
                              Padding(padding: EdgeInsets.only(right: 4)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black26,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(orderStatusList[index], style: TextStyle(color: Colors.deepOrange)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          child: Image.network(
                            merchandisePictureList[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        merchandiseTitleList[index],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              '￥',
                                              style:
                                              TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              '1250',
                                              style:
                                              TextStyle(fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                            padding:
                                            EdgeInsets.only(bottom: 4)),
                                        Text('x2',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 13)),
                                        //Padding(padding: EdgeInsets.only(bottom: 46)),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 4)),
                                Text(
                                  '白色;长裙；S;',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 24)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 2, 12, 10),
                    child: Row(
                      children: <Widget>[
                        Text('总价 ¥ 9998.0'),
                        Padding(padding: EdgeInsets.only(right: 12)),
                        Text('实付款 ¥ '),
                        Text(
                          '9988.0',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                    child: Row(
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: '取消订单');
                          },
                          highlightedBorderColor: Colors.deepOrange,
                          highlightColor: Colors.white12,
                          child: Text('取消订单'),
                        ),
                        Padding(padding: EdgeInsets.only(right: 16)),
                        RaisedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: '立即付款');
                          },
                          color: Colors.deepOrange,
                          child: Text(
                            '立即付款',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}