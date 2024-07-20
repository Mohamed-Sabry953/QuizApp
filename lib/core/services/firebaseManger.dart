import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseManger{
  static CollectionReference subject = FirebaseFirestore.instance.collection('Subjects');
  static CollectionReference question = FirebaseFirestore.instance.collection('arbic');

  static Future<void> deleteSubject(BuildContext context,String id) {
    return subject
        .doc(id)
        .delete()
        .then((value) {
          Navigator.pop(context);
        },);
  }
  static Future<void> deleteQuestion(BuildContext context,String id,Function fun) {
    return question
        .doc(id)
        .delete()
        .then((value) {
          Navigator.pop(context);
          fun();
        },).catchError((e){
      print(e.toString());
    });
  }
}