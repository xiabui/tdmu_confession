import 'package:flutter/material.dart';
import './src/news_feed.dart';
import './src/notifications.dart';
import './src/profile.dart';
import './src/follow.dart';

void main() => runApp(MainApp());


class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "TDMUCofession",
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
    Notifications(),
    Follow(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TDMUCofession",
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
            iconSize: 25,
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
            title: Text("Trang chủ"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Thông báo"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Đang theo dõi"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces),
            title: Text("Hồ sơ"),
          )
        ],
      ),
    );
  }
}