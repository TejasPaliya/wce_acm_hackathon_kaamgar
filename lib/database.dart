import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class authDatabase {
  final String uid;

  authDatabase({required this.uid});

  CollectionReference userID = FirebaseFirestore.instance.collection('User ID');

  Future updateAuthData(String name, String aadhar, String password, String YOB,
      String contactNo) async
  {
    return await userID.doc(uid).set({
      'name': name,
      'aadhar': aadhar,
      'password': password,
      'YOB': YOB,
      'contactNo': contactNo
    }
    );
  }
}
class workerDatabase {
  final String? uid;

  workerDatabase({this.uid});
  CollectionReference worker = FirebaseFirestore.instance.collection('User ID');

  Future updateAuthData(String name, String location, String skills, String YOB,
      String contactNo) async
  {
    return await worker.doc(uid).set({
      'name': name,
      'location': location,
      'skills': skills,
      'YOB': YOB,
      'contactNo': contactNo
    }
    );
  }

  Stream<QuerySnapshot> get workerData {
    return worker.snapshots();
  }
}

