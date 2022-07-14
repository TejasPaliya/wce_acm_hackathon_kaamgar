import 'package:flutter/material.dart';
import 'package:wce_acm_hackathon/Golobals.dart' as globals;
import 'package:wce_acm_hackathon/Register.dart';
import 'package:wce_acm_hackathon/SignIn.dart';
import 'package:wce_acm_hackathon/database.dart';
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();

  }


class _AuthenticateState extends State<Authenticate> {

  @override
  bool showSignIn = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}
