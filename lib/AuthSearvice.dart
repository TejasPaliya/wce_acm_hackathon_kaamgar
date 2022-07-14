import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wce_acm_hackathon/database.dart';
import 'package:wce_acm_hackathon/Golobals.dart' as globals;
class AuthSearvice {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return auth.authStateChanges();
  }

  Future SignInAnon() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User? myuser = result.user;
    } catch (e) {
      return null;
    }
  }

  Future SingOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future SignUpEmail(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? myuser = result.user;
      await authDatabase(uid: myuser!.uid).updateAuthData(globals.name, globals.aadhar, globals.password, globals.YOB, globals.contactNo);
      return myuser;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  Future SignInEmail(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? myuser = result.user;
      return myuser;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
