import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wce_acm_hackathon/Authenticate.dart';
import 'package:wce_acm_hackathon/homePage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userTest=Provider.of<User?>(context);
    if(userTest==null)
      {
        return Authenticate();
      }
    else{
      return HomePage();
    }

  }
}
