import "package:flutter/material.dart";
import 'package:wce_acm_hackathon/AuthSearvice.dart';
import 'package:wce_acm_hackathon/database.dart';
import 'package:wce_acm_hackathon/image_slider.dart';
import 'package:wce_acm_hackathon/my_account.dart';
import 'package:wce_acm_hackathon/Golobals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wce_acm_hackathon/mylist.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;
  final AuthSearvice auth = AuthSearvice();
  final users=workerDatabase().workerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("KAMGAR APP", style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: new ListView(children: <Widget>[
          //header

          //header
          new UserAccountsDrawerHeader(
              accountName: Text(globals.name),
              accountEmail: Text(""),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
              ),
              decoration: new BoxDecoration(
                color: Colors.blueAccent,
              )),
          //body

          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileUI2(),
                  ));
            },
            child: ListTile(
              title: Text("My account"),
              leading: Icon(Icons.person),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () {
              dynamic result = auth.SingOut();
            },
            child: ListTile(
              title: Text("SignOut"),
              leading: Icon(Icons.person),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Certification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue) {
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>
          (
          stream:users,
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot)
          { final data=snapshot.requireData;
            return Container(
              child: ListView.builder(itemCount: data.size,itemBuilder:(context, index)
              {
                return Container(
                  width: 50,
                  child: Card(

                    child: SizedBox(
                      width: 100,
                      child: Padding(padding: EdgeInsets.all( 20),
                      child: Column(
                        children: [
                        Text("Name:${data.docs[index]['name']}"),
                          const SizedBox(
                            height: 2,
                          ),
                          Text("Skills:${data.docs[index]['aadhar']}"),
                          const SizedBox(
                            height: 2,
                          ),

                          Text("ContactNo:${data.docs[index]['contactNo']}"),

                        ],
                      ),
               // child: Card(
                       // margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),

//                ),
                      ),
                    ),
                  ),
                );

              }),
            );
          },
        ),
      ),
    );
  }
  }



