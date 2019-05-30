

class Validation {
  static bool isValidEmail(String email){
    return email != null && email.length > 6 && email.contains('@');
  }
  static bool isValidPassword(String password){
    return password != null && password.length > 8;
  }
  static bool isCompareEmail(String email, String reEmail){
    if(email == reEmail) return true;
    else return false;
  }
  static bool isComparePassword(String password, String rePassword){
    if(password == rePassword) return true;
    else return false;
  }
  static bool isValidName(String name){
    return name != null;
  }
  static bool isValidUserName(String username){
    return username != null;
  }
}