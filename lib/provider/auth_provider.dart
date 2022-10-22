import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  var auth = FirebaseAuth.instance;

  Stream<User?> changeState() {
    return auth.idTokenChanges();
  }  

  void logout() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
}
