import 'package:flutter/material.dart';
import './resources/general_res.dart';

class Notifications extends StatefulWidget{
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool read = false;
  String userName = "Bui Van Xia";
  double textSpanFontSize = 14;
  List<String> typeOfNotifications = [
    " give a heart for your post.",
    " has approved your post.",
    " has deleted for post because ",
    " post somethings for all people here!",
    "\nYour account has been not activated yet. So you need to activate it soon to secure your account when you forgot your password."
  ];

  @override
  Widget build(BuildContext context) {
    var devicesWidth = MediaQuery.of(context).size.width;
    var devicesHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: devicesHeight,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  read = true;
                });
              },
              child: Container(
                color: read == false ? Color(0xffe3f2fd) : Colors.white,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Show avatar
                    avatar('ava.png'),
                    //Show text
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: devicesWidth-85,
                      child: RichText(
                          text: TextSpan(
                              children: [
                                //Username
                                TextSpan(
                                    text: userName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: textSpanFontSize,
                                    )
                                ),

                                //Type of notification
                                TextSpan(
                                    text: typeOfNotifications[4] + "\n",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: textSpanFontSize,
                                    )
                                ),

                                //Time
                                TextSpan(
                                    text: "a minute ago",
                                    style: TextStyle(
                                      color: read == false ? Colors.blue : Colors.grey,
                                      fontSize: textSpanFontSize,
                                    )
                                ),
                              ]
                          )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}