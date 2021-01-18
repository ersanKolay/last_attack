import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  Timestamp dateCreated;
  bool done;

  TodoModel({this.dateCreated, this.todoId, this.done, this.content});

  TodoModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    todoId = documentSnapshot.id;
    content = documentSnapshot['content'];
    dateCreated = documentSnapshot['dateCreated'];
    done = documentSnapshot['done'];
  }
}
