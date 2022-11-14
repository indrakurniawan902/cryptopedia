import 'dart:convert';

import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  Stream<User?> changeState() {
    return _auth.idTokenChanges();
  }

  void logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  User? getUser() {
    final User? user = _auth.currentUser;
    return user;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> postRegister(BuildContext context, VoidCallback onSuccess,
      String email, String fullname, String username) async {
    try {
      var res = await http.post(Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.register}?email=$email&name=$fullname&username=$username"));
      if (res.statusCode == 200) {
        var dataResponse = jsonDecode(res.body);
        print(dataResponse);
        if (dataResponse != null) {
          onSuccess.call();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isRegistered(String? email) async {
    try {
      var res = await http.get(Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.checkRegister}?email=${email ?? ''}"));
      if (res.statusCode == 200) {
        var dataResponse = jsonDecode(res.body);

        if (dataResponse == 1) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
