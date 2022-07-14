 import "package:flutter/material.dart";
import 'package:wce_acm_hackathon/AuthSearvice.dart';
import 'package:wce_acm_hackathon/Authenticate.dart';
import 'package:wce_acm_hackathon/SignIn.dart';
import 'package:wce_acm_hackathon/homePage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'Wrapper.dart';
int n=0;
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // Replace with actual values
      options: FirebaseOptions(
      apiKey: 'AIzaSyBi-_VBsx5FLuuAu5ohjf2AMYVtKx7IFCE',
      appId: '1:757274381177:android:a935c00c129a6be6827da8',
      messagingSenderId: "757274381177",
      projectId: "wce-consumers",
  )
  );

  runApp(
      StreamProvider<User?>.value(
        value: AuthSearvice().user,
        initialData: null,
        child: MaterialApp(
          title:"Bottom APP menu",
          home:Wrapper(),
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
        ),
      )
  );
}
class BottomMenu extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
    return _BottomMenuState();
  }

}
class _BottomMenuState extends State<BottomMenu>{
  int _selectedItem=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
          color: Colors.white,),
      onPressed: (){},),
        ],
      ),
      body:Center(
        child:Text("Welcome to cleanify services"          ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label:"Settings"),
          BottomNavigationBarItem(icon:Icon(Icons.cleaning_services),label:"Services"),


        ],
        currentIndex: _selectedItem,
        onTap:(setValue){
          setState((){
            _selectedItem=setValue;
          });
        },
      ),
    );

  }

}

