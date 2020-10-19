import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/home/shop_street_route.dart';
import 'package:mall/ui/products/products_detail_route.dart';
import 'package:mall/util/constant.dart';
import 'package:mall/util/custom_scroll_behavior.dart';

class MallHomepageRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MallHomepageRouteState();
}

class MallHomepageRouteState extends State<MallHomepageRoute> {
  List<String> imgList = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
  ];

  List<String> hhList = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://gd4.alicdn.com/imgextra/i4/1699627866/O1CN01RcVus927yg4a6UNju_!!1699627866.jpg_400x400.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(false, false, Colors.white),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            homeAppBar(),
            SliverPadding(padding: EdgeInsets.only(top: 16)),
            homeNavigationGridList(),
            SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Container(
                  child: Image.network(
                    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2187506374,3869928049&fm=26&gp=0.jpg',
                    width: _width,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    '热销商品',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 16)),
            productGridList(),
            SliverPadding(
              padding: EdgeInsets.only(top: 16),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    '特色推荐',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            productList(),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 50),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeAppBar() {
    return SliverAppBar(
      backgroundColor: /*Color(0xF2FF5252)*/ Colors.black87,
      title: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white70,
              ),
            ),
            Expanded(
                child: Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 20,
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        '请输入商品关键词',
                        style:
                        TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Icon(
                Icons.message,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Swiper(
          autoplay: true,
          itemBuilder: (context, index) {
            return Image.network(
              imgList[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: 3,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 8,
              color: Colors.grey,
              activeColor: Colors.white,
            ),
          ),
          //control: SwiperControl(),
        ),
      ),
    );
  }

  Widget homeNavigationGridList() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.1,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: Constant.homeTitleList[index]);
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShopStreetRoute()));
              } else if (index == 1) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 2) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 3) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 4) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 5) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 6) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              } else if (index == 7) {
                Fluttertoast.showToast(
                    msg: Constant.homeTitleList[index]);
              }
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    Constant.homeIconList[index],
                    width: 35,
                    height: 35,
                  ),
                  Padding(padding: EdgeInsets.only(top: 4)),
                  Text(Constant.homeTitleList[index]),
                ],
              ),
            ),
          );
        },
        childCount: 8,
      ),
    );
  }

  Widget productGridList() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 0,
        childAspectRatio: 0.65,
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsDetailRoute()));
                  },
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        hhList[index],
                        //width: _width / 2,
                        //fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 6, 4, 0),
                        child: Text(
                          '女装2020年秋季新款大码洋气显瘦马甲两件套装胖妹妹mm减龄连衣裙',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6, 20, 6, 0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
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
        childCount: 6,
      ),
    );
  }

  Widget productList() {
    return SliverList(
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductsDetailRoute()));
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
        childCount: 6,
      ),
    );
  }


}
