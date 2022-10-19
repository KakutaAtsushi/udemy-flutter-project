import 'package:flutter/material.dart';
import 'package:untitled1/pages/setting_profile_page.dart';
import 'package:untitled1/pages/talk_room_page.dart';

import '../model/user.dart';

class TopPages extends StatefulWidget {
  const TopPages({Key? key}) : super(key: key);

  @override
  State<TopPages> createState() => _TopPagesState();
}

class _TopPagesState extends State<TopPages> {
  List<User> userList = [
    User(
        name: "田中",
        uid: "abc",
        image_path:
            "https://www.kubota.co.jp/kubotatanbo/role/img/2-1-1_mechanism_kv.jpg"),
    User(name: "山中", uid: "aebc", image_path: "")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("テストです"),
        //アップバーの右側に表示する
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingProfilePage()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TalkRoomPage(userList[index].name)));
              },
              child: SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: userList[index].image_path != null
                            ? NetworkImage(userList[index].image_path!)
                            : null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userList[index].name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "こんにちは",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
