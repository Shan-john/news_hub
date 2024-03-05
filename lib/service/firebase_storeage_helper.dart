import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_hub/model/user/user.dart';

class Firebase_Storage_helper {
 static Firebase_Storage_helper instance = Firebase_Storage_helper();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserModel> getuserinformation() async {
    DocumentSnapshot<Map<String, dynamic>> QuerySnapshot = await _firestore
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return UserModel.fromJson(QuerySnapshot.data()!);
  }
}
