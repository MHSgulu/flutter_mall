import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';

class ShoppingCartRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShoppingCartRouteState();
}

class ShoppingCartRouteState extends State<ShoppingCartRoute> {
  bool flag = false;
  int count = 1;

  List<String> shopNameList = [
    '都市丽人旗舰店',
    '时尚女郎店',
    '永葆气质店',
  ];

  List<String> imgList1 = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
  ];

  List<String> imgList2 = [
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
  ];

  List<String> imgList3 = [
    'https://gd4.alicdn.com/imgextra/i4/1699627866/O1CN01RcVus927yg4a6UNju_!!1699627866.jpg_400x400.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  bool _selectAll = false;
  bool _selectShop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '购物车',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: flag
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/img_shoppingcart.png',
                    //width: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('你的购物车空空如也',
                        style: TextStyle(color: Colors.black45, fontSize: 13)),
                  ),
                ],
              ),
            )
          : _getShopCartList(),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Divider(
              height: 0,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _selectAll,
                  onChanged: (bool value){
                    setState(() {
                      _selectAll = value;
                    });
                  },
                ),
                Text('全选',style: TextStyle(color: Colors.black54)),
                Expanded(child: Container()),
                Text('合计：'/*,style: TextStyle(color: Colors.black54)*/),
                Text('￥0',style: TextStyle(color: Colors.deepOrange)),
                Padding(padding: EdgeInsets.only(right: 16)),
                RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: (){
                    Fluttertoast.showToast(msg: '商品结算');
                  },
                  child: Text('结算',style: TextStyle(color: Colors.white),),
                ),
                Padding(padding: EdgeInsets.only(right: 8)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getShopCartList(){
    return  ScrollConfiguration(
      behavior: CustomScrollBehavior(false,false,Colors.white),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index1) {
                return Container(
                  margin: EdgeInsets.fromLTRB(6, 8, 6, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: _selectAll,
                            onChanged: (bool value){
                              setState(() {
                                _selectAll = value;
                              });
                            },
                          ),
                          Image.asset(
                            'assets/icons/icon_shop.png',
                            width: 20,
                            height: 20,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text(shopNameList[index1],style: TextStyle(color: Colors.black,fontSize: 15,),),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index2) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _selectAll,
                                      onChanged: (bool value){
                                        setState(() {
                                          _selectAll = value;
                                        });
                                      },
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.network(
                                        index1 == 0 ? imgList1[index2] : index1 == 1 ? imgList2[index2] : imgList3[index2],
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '女装2020年秋季新款大码洋气显瘦马甲两件套装胖妹妹mm减龄连衣裙',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Padding(padding: EdgeInsets.only(bottom: 4),),
                                              Text('白色;S',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                              Padding(padding: EdgeInsets.only(bottom: 16),),
                                              Row(
                                                children: <Widget>[
                                                  Text('￥1238.9',style: TextStyle(color: Colors.deepOrange,fontSize: 16),),
                                                  Expanded(child: Container()),
                                                  SizedBox(
                                                    width: 40,
                                                    height: 20,
                                                    child: Center(
                                                      child: OutlineButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            if(count <= 1){
                                                              Fluttertoast.showToast(msg: '数量不能再少了');
                                                            }else{
                                                              count--;
                                                            }
                                                          });
                                                        },
                                                        child: Text('-'),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                                    child: Text('$count',style: TextStyle(color: Colors.black,fontSize: 14),),
                                                  ),
                                                  SizedBox(
                                                    width: 40,
                                                    height: 20,
                                                    child: Center(
                                                      child: OutlineButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            count++;
                                                          });
                                                        },
                                                        child: Text('+'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
