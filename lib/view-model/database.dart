import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:offspace/models/names.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

//collection reference
  final CollectionReference nameCollection =
      FirebaseFirestore.instance.collection('names');

  Future updateUserData(String name) async {
    await nameCollection.doc(uid).set({'name': name});
  }

//name list from snapshot
  List<Names> _nameListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Names(name: doc.get('name') ?? ''))
        .toList();
  }

//get data stream
  Stream<List<Names>> get names {
    return nameCollection.snapshots().map(_nameListFromSnapshot);
  }
}
