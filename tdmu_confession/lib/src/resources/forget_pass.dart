import 'package:flutter/material.dart';
import 'package:tdmu_confession/src/blocs/login_bloc.dart';
import 'package:tdmu_confession/src/firebase/firebase_auth.dart';
import 'package:tdmu_confession/src/resources/dialogs/loading_dialog.dart';
import 'package:tdmu_confession/src/resources/dialogs/msg_dialog.dart';


class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController emailTextController = new TextEditingController();
  ForgetPassBloc bloc = ForgetPassBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          height: 250,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Password Reset", style: TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
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
                )
              ),
              Container(
                height: 50,
                width: double.infinity,

                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: onResetPress,
                  child: Text("RESET", style: TextStyle(color: Colors.white, fontSize: 20),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onResetPress(){
    setState(() {
      var isValid = bloc.isValidEmail(emailTextController.text);
      if(isValid){
        LoadingDialog.showLoadingDialog(context, "Loading...");
        bloc.forgetPass(emailTextController.text, (){
          LoadingDialog.hideLoadingDialog(context);
        }, (msg){
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, "Somethings Wrong", msg);
        });
      }
    });
  }
}