import 'package:flutter/material.dart';
import 'package:task2/data/models/todo.dart';

class DisplayTodo extends StatelessWidget {
  final ToDo task;
  const DisplayTodo({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 9,
              width: 9,
              decoration: BoxDecoration(
                color: task.id % 3 == 1
                    ?Colors.purpleAccent
                    : task.id % 3 == 2
                    ?Colors.red
                    :Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
              task.id.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
          ),
          const SizedBox(height: 15),
          Text(
              task.todo,
              style: const TextStyle(
                color: Color(0xA13B195B),
                fontWeight: FontWeight.w700,
              ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  task.completed ?'Completed' :'Not Completed',
                  style: const TextStyle(
                    color: Color(0x937E7E7E),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
