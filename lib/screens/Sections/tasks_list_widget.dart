import 'package:flutter/material.dart';

class TasksListDynamicWidget extends StatefulWidget {
  const TasksListDynamicWidget({super.key});

  @override
  State<TasksListDynamicWidget> createState() => _TasksListDynamicWidgetState();
}

class _TasksListDynamicWidgetState extends State<TasksListDynamicWidget> {
  List tasks = ["Task 1", "Task 2", "Task 3", "Task4"];

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) => Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: taskController)),
              ElevatedButton(onPressed: addTask, child: Text("Add task")),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tasks[index]),
                    GestureDetector(
                      onTap: () => deleteTask(index),
                      child: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
  );

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void addTask() {
    final String taskName = taskController.text;
    final String taskLowerCase = taskName.toLowerCase();
    if (taskLowerCase.isEmpty) return;
    setState(() {
      tasks.add(taskLowerCase);
      taskController.clear();
    });
  }
}

//1. Tworzymy widzet ktory bedzie mial wycentrerowany Kontent
//2. Tworzymy zmienna ktora bedzie liczba 
//3. Tworzymy pod liczba dwa przyciski
//4. Pierwszy przycisk bedize sluzyl do wyswietlenia randomwoej liczby
//5. Drugi przycisk bedzie zerował liczbe
//6. trzeci przycisk bedize dodawal liste do liczby  