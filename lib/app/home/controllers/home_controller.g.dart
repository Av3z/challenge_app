// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$todosAtom =
      Atom(name: '_HomeController.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$_loadTodosAsyncAction =
      AsyncAction('_HomeController._loadTodos', context: context);

  @override
  Future<void> _loadTodos() {
    return _$_loadTodosAsyncAction.run(() => super._loadTodos());
  }

  late final _$addTodoAsyncAction =
      AsyncAction('_HomeController.addTodo', context: context);

  @override
  Future<void> addTodo(Todo todo) {
    return _$addTodoAsyncAction.run(() => super.addTodo(todo));
  }

  late final _$deleteTodoAsyncAction =
      AsyncAction('_HomeController.deleteTodo', context: context);

  @override
  Future<void> deleteTodo(String id) {
    return _$deleteTodoAsyncAction.run(() => super.deleteTodo(id));
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
