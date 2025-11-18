import 'dart:math';

import 'package:flutter/material.dart';

class NumberSectionWidgetState extends StatefulWidget {
  const NumberSectionWidgetState({super.key});

  @override
  State<NumberSectionWidgetState> createState() =>
      _NumberSectionWidgetStateState();
}

class _NumberSectionWidgetStateState extends State<NumberSectionWidgetState> {
  int number = 0;
  List numbers = [];
  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(number.toString()),
        ElevatedButton(onPressed: drawNumber, child: Text("Draw number")),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: resetNumber, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white), child: Text("Reset number")),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: addToList,style: ElevatedButton.styleFrom(backgroundColor: Colors.green,foregroundColor: Colors.white), child: Text("Add to list")),
        Expanded(
          child: ListView.builder(
            itemCount: numbers.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(12),
              child: Center(child: Text(numbers[index].toString())),
            ),
          ),
        ),
      ],
    ),
  );
  void drawNumber() {
    Random random = Random();
    setState(() {
      number = random.nextInt(100);
    });
  }

  void resetNumber() {
    setState(() {
      number = 0;
    });
  }

  void addToList() {
    setState(() {
      numbers.add(number);
    });
  }
}
