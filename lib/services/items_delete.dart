import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsDelete {
  final user = FirebaseAuth.instance.currentUser!;

  ItemsDelete();

  Future<void> deleteItem(String uid) async {
    DatabaseReference itemRef =
        FirebaseDatabase.instance.ref('users/${user.uid}/Items').child(uid);
    await itemRef.remove();
  }
}
