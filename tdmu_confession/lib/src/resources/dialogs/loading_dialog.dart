import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog (BuildContext context, String msg){
    showDialog(context: context, barrierDismissible: false,
      builder: (context) => new Dialog(
        child: Container(
          height: 150,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 15,),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(msg, style: TextStyle(fontSize: 18)),
              )
            ],
          ),
        ),
      )
    );
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.pop(context);
  }
}