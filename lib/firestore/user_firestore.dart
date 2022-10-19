import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/firestore/room_firestore.dart';

import '../model/user.dart';
import '../utils/shared_prefs.dart';

class UserFireStore {
  static final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static final _userCollection = _firebaseFirestoreInstance.collection("user");

  static Future<String?> insertNewAccount() async {
    try {
      final newDoc = await _userCollection.add({
        "name": "ななし",
        "image_path":
            "https://www.kubota.co.jp/kubotatanbo/role/img/2-1-1_mechanism_kv.jpg"
      });
      return newDoc.id;
    } catch (e) {
      print("アカウント作成失敗 ====== $e");
      return null;
    }
  }

  static Future<void> createUser() async {
    final myUid = await UserFireStore.insertNewAccount();
    if (myUid != null) {
      await RoomFirestore.createRoom(myUid);
      SharedPrefs.setUid(myUid);
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      fetchUsers() async {
    try {
      final snapshot = await _userCollection.get();
      return snapshot.docs;
    } catch (e) {
      return null;
    }
  }

  static Future<User?> fetchProfile(String uid) async {
    try {
      final snapshot = await _userCollection.doc(uid).get();
      User user = User(
          name: snapshot.data()!["name"],
          image_path: snapshot.data()!["image_path"],
          uid: uid
      );
      return user;
    } catch (e) {
      print("自分の情報を取得するのに失敗しました。---------$e");
      return null;
    }
  }
}
