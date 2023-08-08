
class ToDo
{
  final int id;
  final String todo;
  final bool completed;
  ToDo ({required this.id,required this.todo, required this.completed});

  factory ToDo.fromJson(Map<String, dynamic> json)
  {
    return ToDo(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
    );
  }
}