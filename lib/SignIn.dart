import 'package:flutter/material.dart';
import 'package:wce_acm_hackathon/Golobals.dart' as globals;

import 'AuthSearvice.dart';
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ required this.toggleView });
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? firstname='';
  String? lastname='';
  String password='';
  String? mail='@gmail.com';
  String error='';
  final AuthSearvice auth = AuthSearvice();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        backgroundColor: Colors.blueAccent,
        actions: [
          RaisedButton(onPressed: (){
            widget.toggleView();
          },
            color: Colors.blueAccent,
            child: Text("Register",
              style: TextStyle(color: Colors.white),),
          )
        ],
      ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) =>
                    val!.isEmpty ? 'Enter your first name' : null,
                    decoration: InputDecoration(label: Text("First Name")),
                    onChanged: (val) {
                      setState(() {
                         firstname= val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) =>
                    val!.isEmpty ? 'Enter your last name' : null,
                    decoration: InputDecoration(label: Text("Last Name")),
                    onChanged: (val) {
                      setState(() {
                        lastname = val;

                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) => val!.length <= 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    decoration: InputDecoration(
                        label: Text("Password of atleast 6 chars")),
                    onChanged: (val) {
                      setState(() {
                        password = val;

                      });
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        String? email = firstname! + lastname! + mail!;
                        print(email);
                        dynamic result = await auth.SignInEmail(email, password);
                        if (result == null) {
                          setState(() {
                            error = "Cheack name and password";
                          });
                        }
                      }
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                ],
              ),
            )
        ),
    );
  }
}
