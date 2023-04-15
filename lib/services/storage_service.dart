import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_auth/firebase_auth.dart';

class Storage {
  final user = FirebaseAuth.instance.currentUser!;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      final ref = await storage.ref('images/${user.uid}/$fileName');
      await ref.putFile(file);
      final downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      return "";
    }
  }
}


/* class Storage {
  final user = FirebaseAuth.instance.currentUser!;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      final ref = await storage.ref('images/${user.email!}/$fileName');
      await ref.putFile(file);
      final downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return "";
    }
  }
} */
