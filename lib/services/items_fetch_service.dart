import 'dart:async';
import 'package:flutter/material.dart';

import 'package:closet_assist/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/item.dart';

final userId = FirebaseAuth.instance.currentUser!.uid;

class ItemsFetchService {
  DatabaseReference getDatabaseReference() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseDatabase.instance.ref('users/$userId/');
  }

  Stream<List<Item>> getItems() {
    StreamController<List<Item>> controller = StreamController();
    getDatabaseReference().child('Items').onValue.listen((event) {
      Map<dynamic, dynamic> itemsMap = event.snapshot.value as Map;
      List<Item> items = [];
      itemsMap.forEach((key, value) {
        String colorString = value['color'] ?? "";
        RegExp regex = RegExp(r"([a-fA-F0-9]{8})");
        String hex = regex.stringMatch(colorString) ?? "";
        int valueColor = int.parse(hex, radix: 16);
        Color color = Color(valueColor);
        String timestamp = value['timeUploaded'];

        items.add(
          Item(key, value['name'], value['category'], value['type'],
              value['image'], color, DateTime.parse(timestamp)),
        );
      });
      controller.add(items);
    });
    return controller.stream;
  }
}
