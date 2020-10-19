import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/library/bubble.dart';
import 'package:mall/values/colors.dart';



class ContactCustomerServiceRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ContactCustomerServiceRouteState();

}

class ContactCustomerServiceRouteState extends State<ContactCustomerServiceRoute>{
  ScrollController _scrollController;
  TextEditingController _controller;

  List<String> chatContentList = List();

  void sendMsg() {
    if (_controller.text.trim() != '') {
      if (mounted) {
        setState(() {
          chatContentList.add(_controller.text);
          _controller.clear();
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      }
    } else {
      Fluttertoast.showToast(msg: '请输入聊天消息');
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

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
          '不知名店铺',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: chatListView(),
      bottomSheet: bottomChatInputBox(),
    );
  }

  Widget chatListView() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      controller: _scrollController,
      itemCount: chatContentList.length,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          return Container(
            margin: EdgeInsets.fromLTRB(66, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///这里使用 [Expanded] 效果不好 使用 [Flexible]
                ///强制孩子填充可用空间。 [Expanded]小部件将这种[FlexFit]分配给其子级。
                ///这个孩子最多可以和可用空间一样大（但可以更小）。[Flexible]小部件将这种[FlexFit]分配给其子级。
                Flexible(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 4, 0),
                    child: Bubble(
                      elevation: 0.5,
                      nip: BubbleNip.rightTop,
                      child: Text(chatContentList[index]),
                    ),
                  ),
                ),
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=303910746,3565305595&fm=26&gp=0.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.fromLTRB(12, 8, 66, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1721381929,3931115005&fm=26&gp=0.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                ///这里使用 [Expanded] 效果不好 使用 [Flexible]
                ///强制孩子填充可用空间。 [Expanded]小部件将这种[FlexFit]分配给其子级。
                ///这个孩子最多可以和可用空间一样大（但可以更小）。[Flexible]小部件将这种[FlexFit]分配给其子级。
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 15, 0, 0),
                    child: Bubble(
                      elevation: 0.5,
                      nip: BubbleNip.leftTop,
                      child: Text(chatContentList[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget bottomChatInputBox() {
    return Container(
      //color: Colors.lightBlueAccent,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              decoration: ShapeDecoration(
                color: MyColors.mainBackgroundColor,
                shape: StadiumBorder(),
              ),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '点击此处输入对话',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 60,
              height: 32,
              child: RaisedButton(
                onPressed: () => sendMsg(),
                textColor: Colors.white,
                child: Text('发送'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}