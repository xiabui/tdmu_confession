import 'package:flutter/material.dart';
import './src/news_feed.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final bodies = [
    NewsFeed(),
    NewsFeed(),
    NewsFeed(),
    NewsFeed(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: (int index){
          setState(() {
            selected = index;
          });
        },

        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Follows"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}