import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/ui/shop/detail/shop_details_route.dart';
import 'package:mall/values/colors.dart';

class ShopLiveRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopLiveRouteState();
}

class ShopLiveRouteState extends State<ShopLiveRoute> {
  List<String> shopAvatarList = [
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1498284217,549141933&fm=11&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1994090139,2145311708&fm=26&gp=0.jpg',
  ];

  List<String> shopNameList = [
    '淘宝店舰旗店',
    '天猫牌品店',
  ];

  List<String> liveDescriptionList = [
    '大家好我是渣渣辉',
    '我们先来顶一个小目标',
  ];

  List<String> imageList = [
    'https://img.alicdn.com/bao/uploaded/i4/3385010440/O1CN01n2HkHJ1F7YqV7EC91_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i3/1792580015/O1CN01VCiYdd1ByuUz2nauq_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1870451655/O1CN01deJEEZ1O6274cgsb4_!!1870451655.jpg',
    'https://img.alicdn.com/bao/uploaded/i2/130974249/O1CN01T1E8Af1hG5VcV4Z6U_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i3/3191337305/O1CN016s0mty23pjsclChKZ_!!3191337305-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i2/696944415/O1CN01dyvS431iU7FWaiZBg_!!696944415-0-lubanu-s.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '商家直播',
          style: TextStyle(color: Colors.black87, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: shopLiveList(),
    );
  }

  Widget shopLiveList() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 20),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Fluttertoast.showToast(msg: '进入直播间');
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          shopAvatarList[index],
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 12)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(shopNameList[index]),
                          Text(
                            '30分钟前',
                            style: TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 16),
                        padding: EdgeInsets.fromLTRB(2, 0, 6, 0),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/icon_point.png',
                              width: 10,
                              height: 10,
                            ),
                            Text(
                              '直播中',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ShopDetailsRoute()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepOrange,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'assets/icons/icon_shop_live.png',
                                width: 15,
                                height: 15,
                              ),
                              Padding(padding: EdgeInsets.only(right: 2)),
                              Text(
                                '进店',
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: Text(liveDescriptionList[index]),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                            height: 206,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.black38,
                                    border: Border.all(
                                      color: Colors.white70,
                                      width: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icon_live.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 4)),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                index == 0 ? imageList[2] : imageList[4],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 6)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                index == 0 ? imageList[3] : imageList[5],
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
