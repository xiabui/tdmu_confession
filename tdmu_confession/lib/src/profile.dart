import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdmu_confession/src/resources/view_profile.dart';
import './resources/general_res.dart';
import 'blocs/login_bloc.dart';
import 'resources/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tdmu_confession/src/shared_references/shared_references.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class _ProfileState extends State<Profile>{

  LoginBloc bloc = new LoginBloc();

  bool hasLogin;
  bool loginSuccess;
  bool refresh;

  String userName = "";
  @override
  void initState(){
    super.initState();
    setState(() {
      SharedPreferencesClass.getUserName().then((value){
        userName = value;
      });
      SharedPreferencesClass.getLoginSuccess().then((value){
        hasLogin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            setState(() {
              refresh = true;
            });
          },
          child: refresh == false ? Container(
            alignment: AlignmentDirectional.center,
            color: Colors.lightGreen,
            height: 50,
            width: double.infinity,
            child: Text("Tap here to refresh"),
          ) : SizedBox(height: 0),
        ),
        GestureDetector(
          onTap: onProfilePress,
          child: userBasicInfoView(hasLogin, userName),
        ),
        GestureDetector(
          onTap: (){
            print("");
          },
          child: feature(Icon(Icons.message, size: 35, color: Colors.green,), "Contact to Admin", "Report user, Report service, etc."),
        ),
        GestureDetector(
          onTap: (){
            print(userName);
            print(hasLogin);
          },
          child: feature(Icon(Icons.bug_report, size: 35, color: Colors.redAccent,), "Bugs Report", "Found somethings was wrong, tap here to report."),
        ),
        GestureDetector(
          child: feature(Icon(Icons.card_giftcard, size: 35, color: Color(0xfffbc02d),), "Donate", "Support our to improve product."),
        ),
        GestureDetector(
          child: ads(),
        ),
        GestureDetector(
          child: feature(Icon(Icons.help, size: 35, color: Colors.deepOrangeAccent,), "Help & Support", "Some tips for you or find an issues has been answered"),
        ),
        GestureDetector(
          child: feature(Icon(Icons.language, size: 35, color: Colors.blueAccent,), "Languagues", "Change language app "),
        ),
        GestureDetector(
          child: feature(Icon(Icons.info, size: 35, color: Colors.blue), "About", "More infomations about this app"),
        ),
        GestureDetector(
          onTap: onLogoutPress,
          child: feature(Icon(Icons.arrow_forward_ios, size: 35, color: Colors.redAccent), "Logout", "Logout this app"),
        )
      ],
    );
  }

  void onProfilePress(){
    setState(() async {
      if(hasLogin == false){
        loginSuccess = await Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        refresh = false;
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfile()));
      }
    });
  }

  onLogoutPress() async {
    setState((){
      bloc.signOut();
      hasLogin = false;
      refresh = true;
      userName = "Please click here to reload name";

    });
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}


Widget userBasicInfoView(bool hasLogin, String userName){
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.5)
        )
    ),
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.only(bottom: 15),
    child: hasLogin == false ? Row(
      children: <Widget>[
        avatar('ava.png'),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Anonymous",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Tap here to sign in or sign up your account.",
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        )
      ],
    )
        : Row(
      children: <Widget>[
        avatar('ava.png'),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                userName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "View your profile",
                style: TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget feature(Icon icons, String name, String des){
  return Container(
    margin: EdgeInsets.fromLTRB(15,0,15,10),
    child: Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xffeeeeee),
          ),
          child: icons,
        ),
        SizedBox(width: 10),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                des,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget ads(){
  return Container(
    margin: EdgeInsets.fromLTRB(15,0,15,10),
    child: Row(
      children: <Widget>[
        Container(
          alignment: Alignment(0.0, 0.0),
          padding: EdgeInsets.all(5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xffeeeeee),
          ),
          child: Text("ADS", style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold),),
        ),
        SizedBox(width: 10),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Advertisement",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Make your products famous on our network.",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}


class MsgDialog {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.of(context).pop(MsgDialog);
          },
        )
      ],
    ));
  }
}

