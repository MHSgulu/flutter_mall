import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/my/comments/publish_comments_route.dart';


class AwaitingEvaluationOrderList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AwaitingEvaluationOrderListState();

}

class AwaitingEvaluationOrderListState extends State<AwaitingEvaluationOrderList>{

  List<String> shopTitleList = [
    '诗凡黎官方旗舰店',
    'jessie旗舰店',
  ];

  List<String> orderStatusList = [
    '待评价',
    '待评价',
  ];

  List<String> merchandisePictureList = [
    'https://img.alicdn.com/bao/uploaded/i1/1573475524/O1CN01v9VaPi1qg2UIqRcXv_!!1573475524.jpg',
    'https://img.alicdn.com/bao/uploaded/i1/816267270/O1CN01e32iPS23Zi1BdJ92Y_!!0-item_pic.jpg',
  ];

  List<String> merchandiseTitleList = [
    '商场同款诗凡黎短外套女2020年新款秋装学院风西装外套3B9111221',
    '新品首发】JESSIE学院风高级感西装外套通勤20秋季新品DAFGA196',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 20),
        itemCount: 2,
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
                            Navigator.push(context, MaterialPageRoute(builder: (_) => PublishCommentsRoute()));
                          },
                          highlightedBorderColor: Colors.deepOrange,
                          highlightColor: Colors.white12,
                          child: Text('评价'),
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