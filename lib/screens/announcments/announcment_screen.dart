import "package:flutter/material.dart";
import "announcment_details.dart";
import '../../models/announcment.dart';

class AnnouncmentScreen extends StatefulWidget {
  const AnnouncmentScreen({super.key});

  @override
  State<AnnouncmentScreen> createState() => _AnnouncmentScreenState();
}

class _AnnouncmentScreenState extends State<AnnouncmentScreen> {
  List<Announcment> announcements = [
    Announcment(
      title: "Renault Megane",
      imgUrl:
          "https://a.allegroimg.com/original/11823b/b64257324da5825db7ff1779d1f1/Renault-Megane-1-6B-111KM-2013r-Salon-Polska-1-6-Benzyna-110KM",
      body: "This is the body of announcement 1",
      likes: 0,
    ),
    Announcment(
      title: "Audi 80",
      imgUrl:
          "https://ireland.apollo.olxcdn.com/v1/files/4uax3jhzjool1-OTOMOTOPL/image;s=320x240",
      body: "to jest auto nei do zajechania",
      likes: 0,
    ),
    
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Announcment Screen")),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  announcements[index].imgUrl,
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(announcements[index].title),
                      GestureDetector(
                        onTap: () => showDetails(context, index),
                        child: Text(
                          "Show details",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      announcements[index].likes += 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        announcements[index].likes == 0
                            ? Icons.thumb_down
                            : Icons.thumb_up,
                        color: announcements[index].likes == 0
                            ? Colors.black
                            : Colors.blue,
                      ),
                      Text(announcements[index].likes.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  void showDetails(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnnouncmentDetails(
          title: announcements[index].title,
          details: announcements[index].body,
          likes: announcements[index].likes,
          imgUrl: announcements[index].imgUrl,
        ),
      ),
    );
  }
}
