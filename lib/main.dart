import 'package:flutter/material.dart';
// import 'package:flutter1project/details_screen.dart';
import 'package:flutter1project/screens/announcments/announcment_screen.dart';
import 'package:flutter1project/screens/messenger/messenger_screen.dart';
import 'package:flutter1project/screens/register_screen/register_screen.dart';
// import 'package:flutter1project/screens/cat_fact_screen/cat_facts_screen.dart';
// import 'package:flutter1project/screens/pokemon_screen/pokemon_screen.dart';
// import 'package:flutter1project/grid_widget.dart';
// import 'package:flutter1project/like_section.dart';
// import 'package:flutter1project/number_section.dart';
// import 'package:flutter1project/tasks_list_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://xheeaknycqqihzrzfttf.supabase.co/",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhoZWVha255Y3FxaWh6cnpmdHRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMxNTIwNzEsImV4cCI6MjA3ODcyODA3MX0.vBtmajUFSzSVnH7MF8sEsxqCIkzmHgIFFJ-PJ7N1DwY",
  );

  runApp(const MyApp());
}

/// ta klasa to aplikacja flutterowa
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Supabase.instance.client.auth.currentUser == null
          ? const RegisterScreen()
          : const MessengerScreen(),
    );
  }
}

//My powiedzielismy aplikacji flutterowej zeby korzystala zt ego widetu jako głownego ekranu
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  //Ona jest po to zeby zwracac nam drze`wko widzetow
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Column(children: [])],
        ),
      ),
    );
  }
}

class MyWidgetSecond extends StatelessWidget {
  const MyWidgetSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.person, size: 45),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Kliknieto ikone ustawien");
                    },
                    child: Icon(Icons.settings, size: 45),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                color: Colors.deepPurpleAccent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Cristiano_Ronaldo_WC2022_-_02.jpg/250px-Cristiano_Ronaldo_WC2022_-_02.jpg",
                          height: 150,
                        ),
                      ),

                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jan Kowalskdi",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () => navigateToDetailsScreen(context),
                  child: Text("Open announcements screen"),
                ),
              ),

              // LikeSection(),
              // const SizedBox(height: 30),
              // TasksListDynamicWidget(),
              // NumberSectionWidgetState()
              // GridWidget(),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnnouncmentScreen()),
    );
  }
}

//widzety ktore
