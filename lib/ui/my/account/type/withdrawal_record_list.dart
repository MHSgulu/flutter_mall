import 'package:flutter/material.dart';
import 'package:mall/util/custom_scroll_behavior.dart';



class WithdrawalRecordList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => WithdrawalRecordListState();

}

class WithdrawalRecordListState extends State<WithdrawalRecordList>{

  List<String> titleList = [
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
    '余额提现',
  ];

  List<String> valueList = [
    '-10',
    '-10',
    '-10',
    '-10',
    '-10',
    '-10',
    '-10',
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: CustomScrollBehavior(false, false, null),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          itemCount: 7,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(titleList[index]),
                      Padding(padding: EdgeInsets.only(bottom: 8)),
                      Text('2020-09-09 08:30:59',style: TextStyle(color: Colors.black54,fontSize: 12),),
                    ],
                  ),
                  Expanded(child: Container()),
                  //Text('+ ',style: TextStyle(/*color: Colors.redAccent,*/fontSize: 16),),
                  Text(valueList[index],style: TextStyle(/*color: Colors.redAccent,*/fontSize: 16),),
                ],
              ),
            );
          },
        ),
    );
  }


}