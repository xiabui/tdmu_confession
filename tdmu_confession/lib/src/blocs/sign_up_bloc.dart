import 'dart:async';
import 'package:tdmu_confession/src/validators/validation.dart';
import 'package:tdmu_confession/src/firebase/firebase_auth.dart';

class SignUpBloc {
  var _firebaseAuth = FirebaseSignUpAuth();

  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _reEmailController = new StreamController();
  StreamController _rePasswordController = new StreamController();
  StreamController _usernameController = new StreamController();
  StreamController _userIDController = new StreamController();


  Stream get emailStream => _emailController.stream;
  Stream get reEmailStream => _reEmailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get rePasswordStream => _rePasswordController.stream;
  Stream get usernameStream => _usernameController.stream;
  Stream get userIDStream => _userIDController.stream;

  bool isValidSignUp(String email, String password, String reEmail, String rePassword, String name, String username){
    //Begin email
    if(!Validation.isValidEmail(email)){
      _emailController.sink.addError("Invalid email");
      return false;
    }
    _emailController.sink.add("PASSED");

    if(!Validation.isValidEmail(reEmail)){
      _reEmailController.sink.addError("Invalid email");
      return false;
    }
    _reEmailController.sink.add("PASSED");
    if(!Validation.isCompareEmail(email, reEmail)){
      _reEmailController.sink.addError("Email is not match");
      return false;
    }
    _emailController.sink.add("PASSED");
    _reEmailController.sink.add("PASSED");


    //Begin password
    if(!Validation.isValidPassword(password)){
      _passwordController.sink.addError("Invalid Password");
      return false;
    }
    _passwordController.sink.add("PASSED");

    if(!Validation.isValidPassword(rePassword)){
      _rePasswordController.sink.addError("Invalid Password");
      return false;
    }
    _rePasswordController.sink.add("PASSED");

    if(!Validation.isComparePassword(password, rePassword)){
      _rePasswordController.sink.addError("Password is not match");
      return false;
    }
    _passwordController.sink.add("PASSED");
    _rePasswordController.sink.add("PASSED");


    //Begin user info
    if(!Validation.isValidName(name)){
      _usernameController.sink.addError("Invalid name");
      return false;
    }
    _usernameController.sink.add("PASSED");

    if(!Validation.isValidUserName(username)){
      _userIDController.sink.addError("Invalid username");
      return false;
    }
    _userIDController.sink.add("PASSED");

    return true;
  }

  void signUp(String email, String password, String name, String username, Function onSuccess, Function(String) onErrorSignUp){
    _firebaseAuth.signUp(email, password, name, username, onSuccess, onErrorSignUp);

  }

  void disposed(){
    _emailController.close();
    _reEmailController.close();
    _passwordController.close();
    _rePasswordController.close();
    _userIDController.close();
    _usernameController.close();
  }
}