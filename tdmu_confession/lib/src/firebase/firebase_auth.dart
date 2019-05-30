import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tdmu_confession/src/shared_references/shared_references.dart';
import 'package:tdmu_confession/src/database/user_data.dart';

class FirebaseSignUpAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firebaseDatabase = FirebaseDatabase.instance.reference();

  void signUp(String email, String password, String name, String username, Function onSuccess, Function(String) onErrorSignUp){
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user){
          _createUser(user.uid, name, username, onSuccess, onErrorSignUp);
        })
        .catchError((err){
          //TODO
          _onErrorSignUp(err.code, onErrorSignUp);
        });
  }

  void signIn(String email, String password, Function onSuccess, Function(String) onErrorSignIn) async {
    firebaseAuth
    .signInWithEmailAndPassword(email: email, password: password).then((user){
      _save(user.uid);
      var ref = FirebaseDatabase.instance.reference().child("users");
      ref.child(user.uid).child("name").once().then((DataSnapshot snapshot){
        SharedPreferencesClass.saveUserName(snapshot.value);
        print("Username saved");
      });
      onSuccess();
    }).catchError((err){
      _onErrorSignIn(err.code, onErrorSignIn);
    });
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }

  void forgetPass(String email, Function onSuccess, Function(String) onErrorResetPass){
    firebaseAuth.sendPasswordResetEmail(email: email).then((user){
      onSuccess();
    }).catchError((err){
      onErrorResetPass("Error code 100");
    });
  }

  _createUser(String userID, String name, String username, Function onSuccess, Function(String) onErrorSignUp){
    var user = {
      "name" : name,
      "username" : username,
    };
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userID).set(user).then((user){
      onSuccess();
    }).catchError((err){
      onErrorSignUp("Sign up accout failed!");
    });
  }

  _onErrorSignUp(String code, Function(String) onErrorSignUp){
    switch(code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onErrorSignUp("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onErrorSignUp("Email has been used by another user");
        break;
      case "ERROR_WEAK_PASSWORD":
        onErrorSignUp("Your password was too weak");
        break;
      default:
        onErrorSignUp("Sign up account failed!");
        break;
    }
  }

  _onErrorSignIn(String code, Function(String) onErrorSignIn){
    switch(code) {
      case "ERROR_USER_DISABLED":
        onErrorSignIn("User has been banned");
        break;
      case "ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL":
        onErrorSignIn("Account exits with different credential");
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        onErrorSignIn("Indicates that Google accounts are not enabled");
        break;
      case "ERROR_WEAK_PASSWORD":
        onErrorSignIn("If the action code in the link is malformed, expired, or has already been used");
        break;
      default:
        onErrorSignIn("Unknow");
        break;
    }
  }
  _save(String uid) async {
    SharedPreferencesClass.saveUserID(uid).then((bool success){
      print("saved");
    }).catchError((e){
      print("cant save");
    });
    SharedPreferencesClass.loginSuccessfully();
  }

}