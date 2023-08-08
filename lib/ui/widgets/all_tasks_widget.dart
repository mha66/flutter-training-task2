import 'package:flutter/material.dart';
import 'package:task2/data/models/todo.dart';

class DisplayAllTasks extends StatelessWidget {
  List<ToDo> todoList;
  DisplayAllTasks({super.key, required this.todoList});

  double completionPercentage = 0;

  void getCompletionPercentage(){
    int count = 0;
    for(var item in todoList)
      {
        if(item.completed) {
        count++;
      }
    }
    completionPercentage = count*100/todoList.length;
  }


  @override
  Widget build(BuildContext context) {
    getCompletionPercentage();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0x93800380),
            Colors.deepPurple
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.more_horiz, color: Colors.white,)
            ),
            Text(
              '${completionPercentage.floor().toString()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'All tasks',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${todoList.length.toString()} items',
              style: const TextStyle(
                  color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
