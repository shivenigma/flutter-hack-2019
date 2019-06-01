import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_up/Idea.dart';
import 'dart:async';

class FirestoreHelper {
  void postIdea(Idea idea) {
    Firestore.instance.collection('ideas').add(idea.toMap());
  }

  Future<List<DocumentSnapshot>> fetchPostedIdeas() async {
    QuerySnapshot snapshot = await Firestore.instance.collection('ideas').getDocuments();
    return snapshot.documents;
  }
}
