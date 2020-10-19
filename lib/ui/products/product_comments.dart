import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/util/custom_scroll_behavior.dart';
import 'package:mall/values/colors.dart';

class ProductCommentsRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductCommentsRouteState();
}

class ProductCommentsRouteState extends State<ProductCommentsRoute> {

  List<String> typeList = [
    '09-09  颜色分类：深杏色  尺码：M',
    '09-08  颜色分类：乳白色  尺码：XXL',
    '09-07  颜色分类：绿色  尺码：S',
  ];

  List<String> userAvatarList = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
  ];

  List<String> userNameList = [
    '爱我请忍者的奶奶',
    '就爱如生命的光彩',
    '明镜中的色彩',
  ];

  List<String> commentContentList = [
    '很喜欢这种简单设计感的衣服，款式时尚洋气，版型是显瘦的，实物收到和图片上的 感觉一样很有气质，质量很好，性价比高',
    '宝贝穿上效果超好，大小刚好适合我，超喜欢这种裙子，这种晴天穿着最好了，穿着上班逛街都不错，质量也挺让人满意的',
    '很好看，这种风格看起来很温柔的感觉 设计风格简约大气，有种名媛范儿 颜色很显白嫩，而且真的很显高呀 啊哈哈哈',
  ];

  List<String> hhList = [
    'https://img.alicdn.com/bao/uploaded/i4/2454290360/O1CN01CQSAkB1EWvAsUBAuv_!!2454290360-0-lubanu-s.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/1973739015/O1CN01UIOEDO2GSv6h3ovub_!!0-item_pic.jpg',
    'https://img.alicdn.com/bao/uploaded/i4/864749342/O1CN01iDSjq12IsgfFCNMO6_!!864749342-0-lubanu-s.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/1699627866/O1CN01kuQ9Jv27yg4avFsN7_!!1699627866.jpg_250x250.jpg_.webp',
    'https://gd4.alicdn.com/imgextra/i4/1699627866/O1CN01RcVus927yg4a6UNju_!!1699627866.jpg_400x400.jpg',
    'https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/414503591/O1CN01f6e0fg1cOit5gPhIx_!!414503591-0-lubanu-s.jpg_250x250.jpg_.webp',
  ];

  List<String> titleList = [
    '轻奢名媛法式小众赫本风长裙显高小香风鱼尾裙显瘦气质连衣裙女秋',
    '茶歇法式显瘦显高长裙小香赫本风轻奢名媛气质2020年新款连衣裙秋',
    '2020新款小个子初恋裙大码赫本风小黑裙法式小香风v领连衣裙女秋',
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
          '用户评论',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: productCommentsList(),
    );
  }

  Widget productCommentsList() {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(false, false, null),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
              padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          userAvatarList[index],
                          width: 35,
                          height: 35,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 8)),
                      Text(userNameList[index],style: TextStyle(color: Colors.black87, fontSize: 15),),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: (){
                          Fluttertoast.showToast(msg: '不知名操作');
                        },
                        child: Icon(Icons.more_horiz,color: Colors.black54,size: 20,),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 12)),
                  Text(
                    typeList[index],
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Text(commentContentList[index]),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  commentPhotosList(),
                ],
              ),
            );
          }),
    );
  }

  Widget commentPhotosList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(hhList[index],width: 100,height: 100,),
              ),
            );
          }
      ),
    );
  }

}
