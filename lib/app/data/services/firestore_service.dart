import 'package:challenge_app/app/data/entities/todo.dart';
import 'package:challenge_app/app/data/interface/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService extends DataService {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreService(this._firebaseFirestore);

  @override
  Future<void> create(Todo todo, String uid) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('todos')
          .add(todo.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(Todo todo, String uid) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('todos')
          .doc(todo.id)
          .update(todo.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String uid, String todoId) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('todos')
          .doc(todoId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getTodo(String uid) async {
    var result = <Todo>[];
    var snapshot = await _firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('todos')
        .get();

    for (var doc in snapshot.docs) {
      result.add(Todo.fromJson(doc.id, doc.data()));
    }

    return result;
  }
}
