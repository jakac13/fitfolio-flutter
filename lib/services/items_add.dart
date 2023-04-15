import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsAdd {
  final user = FirebaseAuth.instance.currentUser!;
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  Future<void> addItemToDB(
      String itemName,
      String itemCategory,
      String itemType,
      String downloadURL,
      String itemColor,
      String timeUploaded) async {
    final userUID = user.uid;
    await databaseReference.child("/users/$userUID/Items").push().set({
      'name': itemName,
      'category': itemCategory,
      'type': itemType,
      'image': downloadURL,
      'color': itemColor,
      'timeUploaded': timeUploaded
    });
  }
}
