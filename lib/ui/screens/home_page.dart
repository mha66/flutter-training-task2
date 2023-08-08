import 'package:flutter/material.dart';
import 'package:task2/data/models/todo.dart';
import 'package:task2/ui/widgets/all_tasks_widget.dart';
import 'package:task2/ui/widgets/todo_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<ToDo>> getData() async {
    List<ToDo> todoList = [];
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      for(var item in jsonResponse['todos'])
        {
          todoList.add(ToDo.fromJson(item));
        }
    }
  return todoList;
}

  List<ToDo> todos = [];
  bool  isLoading = true;

  @override
  void initState(){
    Future.delayed(Duration.zero, () async {
      var data = await getData();
      setState(() {
        todos = data;
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('To-do List'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0x93DEDDDD),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: todos.length + 1,
                  itemBuilder: (BuildContext context, index){
                    if(index==0) {
                      return DisplayAllTasks(todoList: todos);
                    } else {
                          return DisplayTodo(task: todos[index-1]);
                        }
                      },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                ),
              ),
              Positioned(
                right: 40,
                child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: const CircleBorder(),
                      minimumSize: const Size.fromRadius(25),
                    ),
                    child: const Text('+'),
                ),
              )
            ],
          ),
      ),
    );
  }
}