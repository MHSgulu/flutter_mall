import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllGoodsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllGoodsRouteState();
}

class AllGoodsRouteState extends State<AllGoodsRoute> {
  bool _isFocus = false;

  bool _isClick1 = true;
  bool _isClick2 = false;
  bool _isClick4 = false;
  bool _isClick4_1 = false;
  bool _isClick4_2 = false;

  bool _isList = false;

  List<String> hhList = [
    'https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/1137281293/O1CN01qY8neX1LQEjG4WDl7_!!0-item_pic.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1137281293/O1CN01gsTbXh1LQEj7ZUbLV_!!1137281293.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1057963225/O1CN01PTgWCm1Zh5vnJb1sm_!!1057963225.jpg_250x250.jpg_.webp',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  List<String> titleList = [
    '欧洲站秋装2020年新款女法式碎花桔梗裙冷淡风两件套装吊带连衣裙',
    '欧洲站2020新款显瘦减龄连衣裙洋气仙女裙V领网纱蕾丝长裙连衣裙',
    '秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
    '秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
    '秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
    '秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
    '秋装2020年新款女法式优雅气质连衣裙女神范复古轻熟风碎花百褶裙',
  ];

  void _change(int index) {
    if (mounted) {
      setState(() {
        if (index == 1) {
          Fluttertoast.showToast(msg: '综合排序');
          _isClick1 = true;
          _isClick2 = false;
          _isClick4 = false;
          _isClick4_1 = false;
          _isClick4_2 = false;
        } else if (index == 2) {
          Fluttertoast.showToast(msg: '销量排序');
          _isClick1 = false;
          _isClick2 = true;
          _isClick4 = false;
          _isClick4_1 = false;
          _isClick4_2 = false;
        } else if (index == 4) {
          if (_isClick4_1 == false) {
            Fluttertoast.showToast(msg: '价格升序排序');
            _isClick1 = false;
            _isClick2 = false;
            _isClick4 = true;
            _isClick4_1 = true;
            _isClick4_2 = false;
          } else {
            Fluttertoast.showToast(msg: '价格降序排序');
            _isClick1 = false;
            _isClick2 = false;
            _isClick4 = true;
            _isClick4_1 = false;
            _isClick4_2 = true;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          shopAppBar(),
          productList(),
        ],
      ),
    );
  }

  Widget shopAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      pinned: true,
      expandedHeight: 145,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 16),
        background: Container(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '儒释道服饰专卖店',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: '店铺资料');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 2.5, 0, 0),
                        child: Image.asset(
                          'assets/icons/icon_round_right.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        //Fluttertoast.showToast(msg: '已关注');
                        setState(() {
                          _isFocus = ! _isFocus;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: <Widget>[
                            _isFocus
                                ? Container()
                                : Image.asset(
                              'assets/icons/icon_we.png',
                              width: 12,
                              height: 12,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                            ),
                            Text(
                              _isFocus ? '已关注' : '关注',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '综合体验',
                      style:
                      TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4),
                    ),
                    RatingBarIndicator(
                      rating: 4,
                      itemSize: 12,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: Colors.redAccent,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                    ),
                    Text(
                      '关注度 3659',
                      style:
                      TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
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
                Container(
                  margin: EdgeInsets.fromLTRB(0, 12, 12, 0),
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
                        'assets/icons/icon_shop3.png',
                        width: 15,
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                      ),
                      Text(
                        '商品分类',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 12, 8),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _change(1);
                    },
                    child: Text(
                      '综合',
                      style: TextStyle(
                        color:
                        _isClick1 ? Colors.deepOrange : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 32),
                  ),
                  GestureDetector(
                    onTap: () {
                      _change(2);
                    },
                    child: Text(
                      '销量',
                      style: TextStyle(
                        color:
                        _isClick2 ? Colors.deepOrange : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 32),
                  ),
                  /*GestureDetector(
                          onTap: (){
                            Fluttertoast.showToast(msg: '新品排序');
                          },
                          child: Text(
                            '新品',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 32),
                        ),*/
                  GestureDetector(
                    onTap: () {
                      _change(4);
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          '价格',
                          style: TextStyle(
                            color: _isClick4
                                ? Colors.deepOrange
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              _isClick4_1
                                  ? 'assets/icons/icon_triangle_up_fill.png'
                                  : 'assets/icons/icon_triangle_up.png',
                              width: 8,
                              height: 8,
                            ),
                            Image.asset(
                              _isClick4_2
                                  ? 'assets/icons/icon_triangle_down_fill.png'
                                  : 'assets/icons/icon_triangle_down.png',
                              width: 8,
                              height: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          _isList = !_isList;
                        });
                      }
                    },
                    child: Image.asset(
                      _isList
                          ? 'assets/icons/icon_list.png'
                          : 'assets/icons/icon_cascades.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(30),
      ),
    );
  }

  Widget productList() {
    final _width = MediaQuery.of(context).size.width;

    return _isList
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(msg: '当前点击的是第${index + 1}件商品');
                        },
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              hhList[index],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 6, 20),
                                    child: Text(
                                      titleList[index],
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Text(
                                          '已售出3件',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
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
              childCount: hhList.length,
            ),
          )
        : SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 0,
              childAspectRatio: 0.82,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(4.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(msg: '当前点击的是第${index + 1}件商品');
                        },
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              hhList[index],
                              height: 150,
                              width: _width / 2,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                              child: Text(
                                titleList[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                    child: Text('￥59.9',
                                        style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 16,
                                        )),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    '已售出3件',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
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
              childCount: hhList.length,
            ),
          );
  }

}
