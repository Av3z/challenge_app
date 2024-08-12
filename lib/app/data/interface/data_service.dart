import 'package:challenge_app/app/data/entities/todo.dart';

abstract class DataService {
  Future<void> create(Todo todo, String uid);
  Future<void> update(Todo todo, String uid);
  Future<void> delete(String uid, String todoId);
  Future<List<Todo>> getTodo(String uid);
}
