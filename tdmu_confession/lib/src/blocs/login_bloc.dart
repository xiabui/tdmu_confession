import 'dart:async';
import 'package:tdmu_confession/src/firebase/firebase_auth.dart';
import 'package:tdmu_confession/src/validators/validation.dart';

class LoginBloc{
  var _firebaseAuth = FirebaseSignUpAuth();

  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidLogin(String email, String password){
    if(!Validation.isValidEmail(email)){
      _emailController.sink.addError("Email is invalid.");
      return false;
    }

    _emailController.sink.add("PASSED");

    if(!Validation.isValidPassword(password)){
      _passwordController.sink.addError("Password is invalid.");
      return false;
    }

    _passwordController.sink.add("PASSED");
    return true;
  }


  void signIn(String email, String password, Function onSuccess, Function(String) onErrorSignIn){
    _firebaseAuth.signIn(email, password, onSuccess, onErrorSignIn);
  }

  void signOut(){
    _firebaseAuth.signOut();
  }

  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
}

class ForgetPassBloc {

  var _firebaseAuth = FirebaseSignUpAuth();

  StreamController emailController = new StreamController();

  Stream get emailStream => emailController.stream;

  bool isValidEmail(String email){
    if(!Validation.isValidEmail(email)){
      emailController.sink.addError("Email is invalid.");
      return false;
    }
    emailController.sink.add("PASSED");
    return true;
  }

  void forgetPass(String email, Function onSuccess, Function(String) onErrorForgetPass){
    _firebaseAuth.forgetPass(email, onSuccess, onErrorForgetPass);
  }

  void disposed(){
    emailController.close();
  }
}