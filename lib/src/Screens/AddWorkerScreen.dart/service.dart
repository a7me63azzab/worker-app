import 'package:firebase_database/firebase_database.dart';

class AddWorker {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  Future<void> addNewworker({String name, String phone, String address}) async {
    try {
      
       await _database.reference()
       .child("users").push().set({
        "name": name,
        "phone": phone,
        "address": address,
        "expenses": [],
      });

      
    } catch (err) {
      print(err);
      // return false;
    }
  }
}
