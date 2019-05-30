import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:tdmu_confession/src/blocs/sign_up_bloc.dart';
import 'package:tdmu_confession/src/resources/dialogs/loading_dialog.dart';
import 'package:tdmu_confession/src/resources/dialogs/msg_dialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  TextEditingController reEmailTextController = new TextEditingController();
  TextEditingController rePasswordTextController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();


  SignUpBloc bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    double devicesHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: devicesHeight*0.05),
            width: double.infinity,
            height: devicesHeight,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Hello there.\nWelcome to\nTDMUConfession!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                ),
                SizedBox(height: 25,),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
                    child: StreamBuilder(
                      stream: bloc.usernameStream,
                      builder: (context, snapshot) => TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: "Your name",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.mail, color: snapshot.hasError ? Colors.red : null,),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: StreamBuilder(
                      stream: bloc.userIDStream,
                      builder: (context, snapshot) => TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            labelText: "Your username",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.mail, color: snapshot.hasError ? Colors.red : null,),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: StreamBuilder(
                      stream: bloc.emailStream,
                      builder: (context, snapshot) => TextField(
                        controller: emailTextController,
                        decoration: InputDecoration(
                            labelText: "Your email",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.mail, color: snapshot.hasError ? Colors.red : null,),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  child: StreamBuilder(
                    stream: bloc.reEmailStream,
                    builder: (context, snapshot) => TextField(
                      controller: reEmailTextController,
                      decoration: InputDecoration(
                          labelText: "Re_enter your email",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          prefixIcon: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.mail, color: snapshot.hasError ? Colors.red : null,),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: StreamBuilder(
                      stream: bloc.passwordStream,
                      builder: (context, snapshot) => TextField(
                        obscureText: true,
                        controller: passwordTextController,
                        decoration: InputDecoration(
                            labelText: "Your password",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.vpn_key, color: snapshot.hasError ? Colors.red : null,),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: StreamBuilder(
                      stream: bloc.rePasswordStream,
                      builder: (context, snapshot) => TextField(
                        obscureText: true,
                        controller: rePasswordTextController,
                        decoration: InputDecoration(
                            labelText: "Re-enter your password",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.vpn_key, color: snapshot.hasError ? Colors.red : null,),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffced0d2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            )
                        ),
                      ),
                    )
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        onPressed: onSignUpPress,
                        child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 18),),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Have an accout?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                      text: "\tSign in now.",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                        }
                                  ),
                                ]
                            ),
                          ]
                      )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  onSignUpPress(){
    setState(() {
      var isValid = bloc.isValidSignUp(emailTextController.text, passwordTextController.text,
          reEmailTextController.text, rePasswordTextController.text,
          nameController.text, usernameController.text);
      if(isValid == true){

        //loading dialog
        LoadingDialog.showLoadingDialog(context, "Loading...");
          bloc.signUp(emailTextController.text, passwordTextController.text, nameController.text, usernameController.text, (){
          LoadingDialog.hideLoadingDialog(context);
        }, (msg){
            // Show msg dialog
            LoadingDialog.hideLoadingDialog(context);
            MsgDialog.showMsgDialog(context, "Somethings Wrong", msg);
          });

      }
    });
  }
}
