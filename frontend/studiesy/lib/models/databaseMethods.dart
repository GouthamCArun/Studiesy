import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseMethods {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getNotes() async {
    return db.collection('Notes').snapshots();
  }

  updateNotes(String transcribe){

  }
}
