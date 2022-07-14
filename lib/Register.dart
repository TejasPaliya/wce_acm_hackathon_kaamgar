import 'package:flutter/material.dart';
import 'package:wce_acm_hackathon/AuthSearvice.dart';
import 'dart:io';
import 'package:wce_acm_hackathon/Golobals.dart' as globals;
import 'Golobals.dart' as globals;
class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();


}

class _RegisterState extends State<Register> {
  final AuthSearvice auth = AuthSearvice();
  final formkey = GlobalKey<FormState>();
  String aadhar = '';
  static String? firstname = '';
  String password = '';
  static String? lastname = '';
  String? email = firstname! + lastname! + mail!;
  static String? mail = '@gmail.com';
  String error = "";
  String YOB="";
  String contactNo="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.blueAccent,
        actions: [
          RaisedButton(
            onPressed: () {
              widget.toggleView();
            },
            color: Colors.blueAccent,
            child: Text(
              "SignIn",
              style: TextStyle(color: Colors.white),
            ),
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
                      firstname = val;
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
                      String name= firstname!+" "+ lastname!;
                      globals.name=name;

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
                      globals.password=password;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Aadhar Number' : null,
                  decoration: InputDecoration(label: Text("Skills")),
                  onChanged: (val) {
                    setState(() {
                      aadhar = val;
                      globals.aadhar=aadhar;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Phone Number' : null,
                  decoration: InputDecoration(label: Text("Contact Number")),
                  onChanged: (val) {
                    setState(() {
                      contactNo = val;
                      globals.contactNo=contactNo;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Year of birth' : null,
                  decoration: InputDecoration(label: Text("Year of birth")),
                  onChanged: (val) {
                    setState(() {
                      YOB = val;
                      globals.YOB=YOB;
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
                      dynamic result = await auth.SignUpEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Dont gove space between name";
                        });
                      }
                    }
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    "SignUp",
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
    ;
  }
}
