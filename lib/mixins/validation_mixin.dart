import 'package:flutter_temp/utils/email_validator.dart';

class ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null) {
      return 'please enter an email address';
    }
    if (value.isEmpty) {
      return 'Please enter an email address';
    }

    if (!value.isValidEmail()) {
      return "Invalid email address";
    }

    return null;
  }

  String? validatePassword(value) {
    if (value == null) {
      return 'please enter a password';
    }
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    int minLength = 3;

    if (value.length < minLength) {
      return 'Password needs to be at least $minLength characters long';
    }

    return null;
  }
}
