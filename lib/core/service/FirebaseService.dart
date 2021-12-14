// ignore: file_names

import 'dart:convert';
import 'dart:io';



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:unit_test_flutter_app/core/model/User.dart';
import 'package:http/http.dart' as http;

class FirebaseService {

  // factory FirebaseService.Connect() async {
  // await Firebase.initializeApp();
  //   return FirebaseService();
  // }

  Future<List> getUsers() async {

    var userList=[];
    Query needsSnapshot = await FirebaseDatabase.instance.ref();
      needsSnapshot.get().then(((DataSnapshot snapshot) {
        if(snapshot.value !=null&& snapshot!=null) {
          var result = snapshot.value as Iterable;
          for(var item in result) {

            final jsonModel = json.decode(item.body);
             userList = jsonModel
                .map((e) => User.fromJson(e as Map<String, dynamic>))
                .toList()
                .cast<User>();

          }

         }
      }));
      return userList;
  }

}