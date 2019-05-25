import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget{
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  bool love = false;
  bool commentTab = false;
  var comment = 1;
  var share = 2;
  var loveCount = 0;
  @override
  Widget build(BuildContext context){
    var divheight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: divheight,
      child: Column(
        children: <Widget>[
          //Top container for show name of app
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
            height: divheight/2*0.19,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text("TDMUConfession",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.search, size: 25),
                )
              ],
            ),
          ),
          
          //Show content of the list of news feed
          Container(
            decoration: BoxDecoration(
                color: Color(0xffe0e0e0)
            ),
            height: divheight - (divheight/2*0.33),
            
            child: ListView(
              padding: EdgeInsets.only(top: 1),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                
                //Part 1: Avatar, name, time, and report
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15,15,15,5),
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  //Container de chua hinh anh dai dien
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Image.asset('ava.png'),
                                  ),
                                  SizedBox(width: 10,),
                                  //Name and Time
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      SizedBox(height: 5,),
                                      Text("a minute ago", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            //Three dots
                            Container(
                              child: Icon(Icons.more_horiz, size: 25, color: Colors.grey,),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        child: Text("So I am making an app and facing problem with pixel overflow"
                            "on different devices. The container that fits right for widgets on iPhone XR"
                            "does not go with Google Pixel 2 XL. Does anyone have solutions for it, so I"
                            "can keep the container size same for all the devices and get the widgets fit"
                            "into with the same code?",
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Show love icon and comment if it has
                            loveCount != 0 ? Row(
                              children: <Widget>[
                                Icon(Icons.favorite, color: Colors.redAccent, size: 20,),
                                Text("  $loveCount", style: TextStyle(fontSize: 14),)
                              ],
                            ): SizedBox(height: 0),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  comment == 1 ? Text("$comment comment\t\t", style: TextStyle(fontSize: 14))
                                      : comment >= 2 ? Text("$comment comments\t\t", style: TextStyle(fontSize: 14))
                                      : SizedBox(height:0),
                                  share == 1 ? Text("$share share", style: TextStyle(fontSize: 14))
                                      : share >= 2 ? Text("$share shares", style: TextStyle(fontSize: 14))
                                      : SizedBox(height:0),
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.3),
                            bottom: comment != 0 ? BorderSide(color: Colors.grey, width: 0.3) : BorderSide(color: Colors.white),
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: onLoveTap,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    love == false ? Icon(Icons.favorite_border, color: Colors.grey, size: 25,) : Icon(Icons.favorite, color: Colors.redAccent, size: 25,),
                                    Text("  Love ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: love == false ? Colors.grey : Colors.redAccent,
                                        fontWeight: love == false ? FontWeight.normal : FontWeight.bold,
                                      )
                                    ),
                                  ],
                                ),
                              )
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.chat_bubble_outline, color:  Colors.grey, size: 25,),
                                  Text("  Comment ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.share, color: Colors.grey, size: 25,),
                                  Text("  Share ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Container de chua hinh anh dai dien
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Image.asset('ava.png'),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xffeeeeee),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Text("hahahah ahah aha ha aha h ahahah ah aha ah"
                                                  "ha haah ah ah ah ah ah ah ha ah ",
                                          style: TextStyle(fontSize: 16, color: Colors.black)),
                                    )
                                  ],
                              ),
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15,15,15,5),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            //Container de chua hinh anh dai dien
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Image.asset('ava.png'),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 5,),
                                Text("a minute ago", style: TextStyle(fontSize: 16, color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        child: Text("So I am making an app and facing problem with pixel overflow"
                            "on different devices. The container that fits right for widgets on iPhone XR"
                            "does not go with Google Pixel 2 XL. Does anyone have solutions for it, so I"
                            "can keep the container size same for all the devices and get the widgets fit"
                            "into with the same code?",
                          style: TextStyle(
                            fontSize: 16,
                          ),),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15,5,15,5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Show love icon and comment if it has
                              loveCount != 0 ? Row(
                                children: <Widget>[
                                  Icon(Icons.favorite, color: Colors.redAccent, size: 20,),
                                  Text("  $loveCount", style: TextStyle(fontSize: 14),)
                                ],
                              ): SizedBox(height: 0),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    comment == 1 ? Text("$comment comment\t\t", style: TextStyle(fontSize: 14))
                                        : comment >= 2 ? Text("$comment comments\t\t", style: TextStyle(fontSize: 14))
                                        : SizedBox(height:0),
                                    share == 1 ? Text("$share share", style: TextStyle(fontSize: 14))
                                        : share >= 2 ? Text("$share shares", style: TextStyle(fontSize: 14))
                                        : SizedBox(height:0),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.black45, width: 0.3),
                              bottom: comment != 0 ? BorderSide(color: Colors.black45, width: 0.3) : BorderSide(color: Colors.white),
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                                onTap: onLoveTap,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      love == false ? Icon(Icons.favorite_border, color: Colors.grey, size: 25,) : Icon(Icons.favorite, color: Colors.redAccent, size: 25,),
                                      Text("  Love ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: love == false ? Colors.grey : Colors.redAccent,
                                            fontWeight: love == false ? FontWeight.normal : FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 25,),
                                  Text("  Comment ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.share, color: Colors.grey, size: 25,),
                                  Text("  Share ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15,5,15,5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Container de chua hinh anh dai dien
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                                child: Image.asset('ava.png'),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffeeeeee),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Text("hahahah ahah aha ha aha h ahahah ah aha ah"
                                          "ha haah ah ah ah ah ah ah ha ah ",
                                          style: TextStyle(fontSize: 16, color: Colors.black)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15,15,15,5),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            //Container de chua hinh anh dai dien
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              child: Image.asset('ava.png'),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                SizedBox(height: 5,),
                                Text("a minute ago", style: TextStyle(fontSize: 16, color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        child: Text("So I am making an app and facing problem with pixel overflow"
                            "on different devices. The container that fits right for widgets on iPhone XR"
                            "does not go with Google Pixel 2 XL. Does anyone have solutions for it, so I"
                            "can keep the container size same for all the devices and get the widgets fit"
                            "into with the same code?",
                          style: TextStyle(
                            fontSize: 16,
                          ),),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15,5,15,5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Show love icon and comment if it has
                              loveCount != 0 ? Row(
                                children: <Widget>[
                                  Icon(Icons.favorite, color: Colors.redAccent, size: 20,),
                                  Text("  $loveCount", style: TextStyle(fontSize: 14),)
                                ],
                              ): SizedBox(height: 0),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    comment == 1 ? Text("$comment comment\t\t", style: TextStyle(fontSize: 14))
                                        : comment >= 2 ? Text("$comment comments\t\t", style: TextStyle(fontSize: 14))
                                        : SizedBox(height:0),
                                    share == 1 ? Text("$share share", style: TextStyle(fontSize: 14))
                                        : share >= 2 ? Text("$share shares", style: TextStyle(fontSize: 14))
                                        : SizedBox(height:0),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.fromLTRB(15,5,15,5),
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.black45, width: 0.3),
                              bottom: comment != 0 ? BorderSide(color: Colors.black45, width: 0.3) : BorderSide(color: Colors.white),
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                                onTap: onLoveTap,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      love == false ? Icon(Icons.favorite_border, color: Colors.grey, size: 25,) : Icon(Icons.favorite, color: Colors.redAccent, size: 25,),
                                      Text("  Love ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: love == false ? Colors.grey : Colors.redAccent,
                                            fontWeight: love == false ? FontWeight.normal : FontWeight.bold,
                                          )
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 25,),
                                  Text("  Comment ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.share, color: Colors.grey, size: 25,),
                                  Text("  Share ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15,5,15,5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Container de chua hinh anh dai dien
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                                child: Image.asset('ava.png'),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffeeeeee),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Bui Van Xia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.7,
                                      child: Text("hahahah ahah aha ha aha h ahahah ah aha ah"
                                          "ha haah ah ah ah ah ah ah ha ah ",
                                          style: TextStyle(fontSize: 16, color: Colors.black)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),//Card
              ],
            ), // ListView
          )
        ],
      ),
    );
  }

  void onLoveTap(){
    setState(() {
      if(love == false){
        love = true;
        loveCount++;
      } else {
        love = false;
        loveCount--;
      }
    });
  }
}
