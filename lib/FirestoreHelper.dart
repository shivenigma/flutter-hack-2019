
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_up/Idea.dart';

class FirestoreHelper {

  void postIdea(Idea idea) {
    Firestore.instance
        .collection('ideas')
        .add(idea.toMap());
  }

}