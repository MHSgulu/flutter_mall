import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:vertical_tabs/vertical_tabs.dart';



class ClassificationShopGoodsRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ClassificationShopGoodsRouteState();

}

class ClassificationShopGoodsRouteState extends State<StatefulWidget>{

  List<Tab> tabList = <Tab>[
    Tab(text: '小黑裙',),
    Tab(text: '晚礼服',),
    Tab(text: '长白裙',),
    Tab(text: '大红衣'),
    Tab(text: '黑风衣',),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.5,
        title: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/icon_search.png',
                        width: 15,
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6),
                      ),
                      Text(
                        '搜索店内商品',
                        style: TextStyle(
                            color: Colors.black38, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close,color: Colors.black,),
              ),
            ],
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(false,false,null),
        child: VerticalTabs(
          tabsWidth: 100,
          indicatorWidth: 3,
          tabsElevation: 1,
          indicatorColor: Colors.deepOrange,
          contentScrollAxis: Axis.vertical,
          selectedTabBackgroundColor: Colors.white12,
          tabBackgroundColor: Colors.white12,
          selectedTabTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 13),
          tabTextStyle: TextStyle(color: Colors.black54, fontSize: 13),
          tabsShadowColor: Colors.black,
          backgroundColor: Colors.white,
          tabs: tabList,
          contents: <Widget>[
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
                          child: Center(
                            child: Text(
                              '小黑裙',
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
                itemCount: 10,
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
                            'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/4241813471/O1CN01BLWTcz1bVlM2W8ocL_!!4241813471-0-lubanu-s.jpg_250x250.jpg_.webp',
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 6)),
                        SizedBox(
                          width: 70,
                          child: Center(
                            child: Text(
                              '酒红色晚礼服',
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
          ],
        ),
      ),
    );
  }


}