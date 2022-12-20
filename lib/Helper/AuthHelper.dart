import 'dart:developer';
import 'package:doctor/AppRouter/AppRouter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthHelper {
  AuthHelper._Doctors();

  static AuthHelper authHelper = AuthHelper._Doctors();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppRouter.shoeCustomDialog('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppRouter.shoeCustomDialog('Wrong password provided for that user.');
      } else {
        AppRouter.shoeCustomDialog(e.toString());
      }
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppRouter.shoeCustomDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppRouter.shoeCustomDialog(
            'The account already exists for that email.');
      } else {
        AppRouter.shoeCustomDialog(e.toString());
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  User? checkUser() {
    return firebaseAuth.currentUser;

  }
}
