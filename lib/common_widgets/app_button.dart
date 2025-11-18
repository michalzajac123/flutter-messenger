import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onPressed, required this.isLoading});

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0084FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: isLoading? CircularProgressIndicator(color: Colors.white, padding: EdgeInsets.all(6),) :  Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
    ),
  );
}
