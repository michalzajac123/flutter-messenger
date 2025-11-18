import "package:flutter/material.dart";

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("More Info Screen")),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () => {Navigator.of(context).popUntil((route) => route.isFirst)},
          child: Center(child: Text("More info screen, tap to go back")),
        ),
      ),
    ),
  );
}
