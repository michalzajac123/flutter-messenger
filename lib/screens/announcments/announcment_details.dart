import "package:flutter/material.dart";

class AnnouncmentDetails extends StatelessWidget {
  const AnnouncmentDetails({
    required this.details,
    required this.title,
    required this.likes,
    required this.imgUrl,
    super.key,
  });
  final String details;
  final String title;
  final int likes;
  final String imgUrl;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(imgUrl, width: 200, height: 200),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(details),
            const SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(likes.toString(), style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
