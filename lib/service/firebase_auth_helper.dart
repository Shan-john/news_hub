import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/model/user/user.dart';

class FirebaseAuth_Helper {
  static FirebaseAuth_Helper instance = FirebaseAuth_Helper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> SignUp(String email, String password, String username) async {
    try {
      showMessage("SigningUP..");
      UserModel user =
          UserModel(email: email, password: password, names: username);

      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      print("firebse");
      _firestore
          .collection("User")
          .doc(userCredential.user!.uid)
          .set(user.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> Login(
    String email,
    String password,
  ) async {
    try {
      showMessage("logining..");
   
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showMessage("Login successfully completed ..");
      return true;
    }  on FirebaseAuthException catch  (e) {
      showMessage(e.code.toString());
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      showMessage("logout");
      await _auth.signOut();
      return true;
    } catch (e) {
      showMessage("failed to Sign Out");
      return false;
    }
  }
}
