class Todo {
  final String id;
  final String title;
  final String description;

  Todo({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  factory Todo.fromJson(String id, Map<String, dynamic> json) => Todo(
        id: id,
        title: json['title'],
        description: json['description'],
      );
}
