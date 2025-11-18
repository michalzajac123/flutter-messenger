import 'package:flutter/material.dart';
import 'package:flutter1project/screens/Sections/more_info_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.title,
    required this.subttitle,
    super.key,
  });

  final String title;
  final String subttitle;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("announcements screen")),
    body: SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(child: Text("Tap to go back")),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoreInfoScreen()),
              );
            },
            child: Text("Navigate to More Info Screen"),
          ),
          const SizedBox(height: 40),
          Text(title),
          const SizedBox(height: 20),
          Text(subttitle),
        ],
      ),
    ),
  );
}

//0. Dodac nowy ekran
//1. dodaj liste elementow lub grdi dowolnie
//3. Za pomoca stanui mozliwosc polubneia teg oelementu
//4 Klikeamy na dany element

