// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHandler {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<dynamic>> getBriefs() async {
    List<dynamic> briefs = [];

    await db.collection("brief").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          briefs.add(docSnapshot.data());
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return briefs;
  }
}
