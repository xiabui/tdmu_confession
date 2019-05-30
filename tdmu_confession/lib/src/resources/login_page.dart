import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'forget_pass.dart';
import 'sign_up.dart';
import 'package:tdmu_confession/src/blocs/login_bloc.dart';
import 'package:tdmu_confession/src/resources/dialogs/loading_dialog.dart';
import 'package:tdmu_confession/src/resources/dialogs/msg_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPass = false;
  bool errorEmail = false;
  bool errorPassword = false;
  bool loginSuccess = true;

  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();

  String errorEmailText = "Email invalid";
  String errorPasswordText = "Password invalid";

  LoginBloc bloc = new LoginBloc();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<String> _testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await firebaseAuth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  @override
  Widget build(BuildContext context) {
    double devicesHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: devicesHeight*0.1),
          width: double.infinity,
          height: devicesHeight,
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Hi there.\nWelcome back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              ),
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) => TextField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                        labelText: "Email",
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
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: bloc.passwordStream,
                        builder: (context, snapshot) => TextField(
                          controller: passwordTextController,
                          obscureText: !showPass,
                          decoration: InputDecoration(
                              labelText: "Password",
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
                      ),
                      GestureDetector(
                          onTap: onShowPress,
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            child: showPass == false ? Text("SHOW", style: TextStyle(color: Colors.blueAccent,fontSize: 16),)
                                : Text("HIDE", style: TextStyle(color: Colors.redAccent,fontSize: 16),),
                          )
                      )
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: GestureDetector(
                  onTap: onForgetPassword,
                  child: Text("Forgot password?", style: TextStyle(color: Colors.blue, fontSize: 16),),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: onSignInPress,
                      child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 18),),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))
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
                      onPressed: () => _testSignInWithGoogle().then((user)=>print(user)).catchError((e) => print(e)),
                      child: Text("LOGIN WITH GOOGLE", style: TextStyle(color: Colors.white, fontSize: 18),),
                      color: Colors.redAccent,
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
                              text: "Haven't accout yet?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                    text: "\tSign up new account.",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
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
      )
    );
  }
  void onShowPress(){
    setState(() {
      if(showPass == false){
        showPass = true;
      } else {
        showPass = false;
      }
    });
  }

  void onSignInPress(){
    setState(() {
      var isValid = bloc.isValidLogin(emailTextController.text, passwordTextController.text);
      if(isValid == true){
        //loading dialog
        LoadingDialog.showLoadingDialog(context, "Loading...");
        bloc.signIn(emailTextController.text, passwordTextController.text, (){
          LoadingDialog.hideLoadingDialog(context);
          Navigator.pop(context, true);
        }, (msg){
          // Show msg dialog
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Somethings Wrong", msg);
        });
      }
    });
  }

  onForgetPassword(){
    setState(() {
      Navigator.push((context), MaterialPageRoute(builder: (context) => ForgetPass()));
    });
  }
}
