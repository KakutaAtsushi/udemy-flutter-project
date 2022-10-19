import "package:flutter/material.dart";
import 'package:intl/intl.dart' as intl;
import '../model/message.dart';

//StatefulWidgetからクラス内変数を参照するには、widget.で参照可能
class TalkRoomPage extends StatefulWidget {
  final String name;

  const TalkRoomPage(this.name, {Key? key}) : super(key: key);

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Message> messageList = [
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "あいう", isMe: true, sendTime: DateTime(2021, 1, 1, 12, 0)),
    Message(message: "かきく", isMe: false, sendTime: DateTime(2021, 1, 1, 13, 0)),
    Message(
        message:
            "さしdsal,dl,adl;sa,dla,dlsa,dla,dl;a,dl;a,dl;a,dl;adl;akdl;akldkal;dkal;dkasl;dkal;dkal;dkaす",
        isMe: true,
        sendTime: DateTime(2021, 1, 1, 12, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      //リスト表示を行う
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
                //要素がスクロールするに満たない場合はスクロールを不可にする　スクロールで見切れてしまう場合に有効
                physics: RangeMaintainingScrollPhysics(),
                //メッセージの量が少ない場合は上から表示を行う
                shrinkWrap: true,
                //順番を逆にする
                reverse: false,
                //指定したアイテムの数だけ繰り返す
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  //行表示
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10,
                        right: 10,
                        bottom: index == 0 ? 10 : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //テキストの配置を右（rtl）と左に変更する(ltr)
                      textDirection: messageList[index].isMe
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        //余白を取る
                        Padding(
                          padding:
                              //symmetricは左右と縦を対象に変更する　縦＝horizontal, 横=vertical
                              const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                          child: Container(
                              // MediaQuery.of(context).size.widthで画面の横幅をとり、BoxConstraintsでコンテナの最大横幅は取得横幅の0.6倍までと設定を行う
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.6),
                              //containerの中身をデコレーションする
                              decoration: BoxDecoration(
                                  color: messageList[index].isMe
                                      ? Colors.green
                                      : Colors.white,
                                  //ボーダーを丸に変更する
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(messageList[index].message)),
                        ),
                        Text(intl.DateFormat("HH:mm")
                            .format(messageList[index].sendTime))
                      ],
                    ),
                  );
                }),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  color: Colors.white,
                  height: 60,
                  child: Row(
                    children: [
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        //textフィールドを表示する
                        child: TextField(
                          //inputのデザインを変更する
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              //inputの周りにborder
                              border: OutlineInputBorder()),
                        ),
                      )),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.send))
                    ],
                  )),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          )
        ],
      ),
    );
  }
}
