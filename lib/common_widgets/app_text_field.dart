import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({required this.controller ,super.key});

  final TextEditingController controller;


  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: "Type a message",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    ),
  );
}