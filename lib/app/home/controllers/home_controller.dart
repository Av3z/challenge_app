import 'package:mobx/mobx.dart';
import 'package:challenge_app/app/data/entities/todo.dart';
import 'package:challenge_app/app/data/interface/data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final DataService dataService;
  final FirebaseAuth auth;

  _HomeController(this.dataService, this.auth) {
    _loadTodos();
  }

  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  String currentTitle = '';

  @observable
  String currentDescription = '';

  @action
  Future<void> _loadTodos() async {
    final uid = auth.currentUser!.uid;
    final fetchedTodos = await dataService.getTodo(uid);
    todos.clear();
    todos.addAll(fetchedTodos);
  }

  @action
  Future<void> addTodo(Todo todo) async {
    final uid = auth.currentUser!.uid;
    await dataService.create(todo, uid);
    _loadTodos();
  }

  @action
  Future<void> deleteTodo(String id) async {
    final uid = auth.currentUser!.uid;
    await dataService.delete(uid, id);
    _loadTodos();
  }

  @action
  Future<void> updateTodo(Todo todo) async {
    final uid = auth.currentUser!.uid;
    await dataService.update(todo, uid);
    _loadTodos();
  }

  @action
  void setCurrentTodoDetails(String title, String description) {
    currentTitle = title;
    currentDescription = description;
  }
}
