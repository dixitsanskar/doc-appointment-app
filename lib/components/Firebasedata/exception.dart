
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknown Error Occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case "email-already-in-use":
        return const SignUpWithEmailAndPasswordFailure("Email Already In Use");
      case "invalid-email":
        return const SignUpWithEmailAndPasswordFailure("Invalid Email");
      case "operation-not-allowed":
        return const SignUpWithEmailAndPasswordFailure("Operation Not Allowed");
      case "weak-password": 
        return const SignUpWithEmailAndPasswordFailure("Weak Password");
      case "user-disabled":
        return const SignUpWithEmailAndPasswordFailure("User Disabled");
      default:
        return const SignUpWithEmailAndPasswordFailure();
  }
  }

}