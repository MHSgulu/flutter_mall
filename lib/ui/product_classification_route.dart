import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class ProductClassificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductClassificationRouteState();
}

class ProductClassificationRouteState extends State<ProductClassificationRoute> {
  List<Tab> tabList = <Tab>[
    Tab(text: '今日推荐',),
    Tab(text: '家用电器',),
    Tab(text: '洗护美妆',),
    Tab(text: '运动户外'),
    Tab(text: '健康食品',),
    Tab(text: '生活服务',),
    Tab(text: '图书影音',),
    Tab(text: '虚拟商品',),
    Tab(text: '医药保健',),
    Tab(text: '服饰鞋帽',),
    Tab(text: '手机数码',),
    Tab(text: '每日冷鲜',),
  ];


  List<String> imgList = [
    'https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/2616970884/O1CN01SLO6po1IOukEhzVBb_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/2838892713/O1CN01YDtXnH1Vub9B11fiq_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/2616970884/O1CN01TaHTiv1IOukEKmoY6_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i3/1714128138/O1CN01i7gxdM29zFnsQqFSw_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i2/31676741/O1CN01jkAXKu1zfQVArkjHb_!!2-saturn_solar.png_250x250.jpg_.webp',
    'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/901409638/O1CN01V7rtZj2L4Fu88Gh28_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/370627083/O1CN01sfX9wv22C3xHpRzse_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/2616970884/O1CN01Z6kdz71IOuk1Y5xpX_!!0-item_pic.jpg_250x250.jpg_.webp',
  ];

  List<String> titleList = [
    'iPhone 11',
    '华为nova7',
    '荣耀Play4 PRO',
    '红米k30pro',
    'vivo S7',
    'OPPO A32',
    '三星Galaxy S10',
    '魅族17',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0.5,
      title: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: '搜索商品');
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 0.5),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black26,
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text(
                      '搜索您关注的商品',
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: '消息');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Icon(Icons.message,color: Colors.black38,),
            ),
          )
        ],
      ),
    ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(false,false,null),
        child: VerticalTabs(
          tabsWidth: 105,
          indicatorWidth: 3,
          tabsElevation: 1,
          indicatorColor: Colors.deepOrange,
          contentScrollAxis: Axis.vertical,
          selectedTabBackgroundColor: Colors.white12,
          tabBackgroundColor: Colors.white,
          selectedTabTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 13),
          tabTextStyle: TextStyle(color: Colors.black54, fontSize: 13),
          tabsShadowColor: Colors.black,
          backgroundColor: Colors.white,
          tabs: tabList,
          contents: <Widget>[
            Container(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 20),
                itemCount: imgList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            imgList[index],
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 6)),
                        SizedBox(
                          width: 70,
                          child: Center(
                            child: Text(
                              titleList[index],
                              style: TextStyle(color: Colors.black45, fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 20),
                itemCount: 16,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            'https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/2966302535/O1CN01RTfMle1Ub4dzFOvfK_!!0-item_pic.jpg_250x250.jpg_.webp',
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 6)),
                        SizedBox(
                          width: 70,
                          child: Text(
                            '小黑裙',
                            style: TextStyle(color: Colors.black45, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              color: Colors.black45,
            ),
            Container(
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              height: 200,
              color: Colors.redAccent,
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              color: Colors.black45,
            ),
            Container(
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              height: 200,
              color: Colors.redAccent,
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
