import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/model/user/user.dart';

class FirebaseAuth_Helper {
  static FirebaseAuth_Helper instance = FirebaseAuth_Helper();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();
  
  Future<bool> SignUp(String email, String password, String username) async {
    try {
      showMessage("SigningUP..");
      UserModel user =
          UserModel(email: email, password: password, names: username);
      _firestore
          .collection("User")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toJson());
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> Login(
    String email,
    String password,
  ) async {
    try {
      showMessage("Logining");
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (e) {
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
