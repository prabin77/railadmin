import 'package:railway_admin/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'model/schedule.dart';

class FiresbaseServices {
  CollectionReference schedule =
      FirebaseFirestore.instance.collection('schedule');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> signin({String? email, String? pass}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: pass!);
      if (userCredential.user != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return false;
      }
      return false;
    }
  }

  Future<List<Schedule>> getSchedule() {
    return schedule
        //  .where('date', isEqualTo: DateTime.now().toString().split(' ')[0])
        .get()
        .then((value) {
      print(value);
      var e = value.docs
          .map((e) => Schedule.fromJson(
              e.data() as Map<String, dynamic>, e.reference.id))
          .toList();
      print('er');
      print(e);
      print(e[0]);
      return e;
    });
  }

  Future<void> addschedule({
    String? train_no,
    String? train_name,
    String? from,
    String? to,
    String? date,
    String? time,
    String? totalseat1ac,
    String? price1ac,
    String? totalseatfc,
    String? pricefc,
    String? totalseat2ac,
    String? price2ac,
    String? totalseat3ac,
    String? price3ac,
  }) {
    // Call the user's CollectionReference to add a new user

    String uid = FirebaseAuth.instance.currentUser!.uid;
    return schedule
        .add({
          
          'train_name': train_name,
          'train_no': train_no,
          'time': time,
          'date': date,
          'to': to,
          'from': from,
          '1A AC First Class': {
            "total_seats": int.parse(totalseat1ac!),
            "empty_seats": int.parse(totalseat1ac),
            "booked_seats": 0,
            "price": int.parse(price1ac!)
          },
          'FC First class': {
            "total_seats": int.parse(totalseatfc!),
            "empty_seats":int.parse(totalseatfc),
            "booked_seats": 0,
            "price": int.parse(pricefc!),
          },
          '2A AC 2-Tier': {
            "total_seats": int.parse(totalseat2ac!),
            "empty_seats":int.parse( totalseat2ac),
            "booked_seats": 0,
            "price": int.parse(price2ac!)
          },
          '3A AC 3-Tier': {
            "total_seats": int.parse(totalseat3ac!),
            "empty_seats":int.parse( totalseat3ac),
            "booked_seats": 0,
            "price": int.parse(price3ac!)
          },

          //'total_cost': total_cost,
        })
        .then((value) => print("schedule added"))
        .catchError((error) => print("Failed to add schedule: $error"));
  }
}
