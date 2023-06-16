import 'package:email_validator/email_validator.dart';

abstract class Validations {
  static final RegExp passwordStrongRegEx =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  static final RegExp upperCase = RegExp(r'^(?=.*?[A-Z])$');
  static final RegExp lowerCase = RegExp(r'^(?=.*?[a-z])$');
  static final RegExp nameRegex = RegExp(r"^[a-zA-Z]+$");
  static final RegExp numberRegex = RegExp(r"^\d+$");
  static final RegExp specialCharacter = RegExp(r'^(?=.*?[!@#\$&*~])$');
  static final RegExp _length = RegExp(r'^.{8,}$');

  static String? validateEmail(String value) {
    String emailForm = "WWW.DDDD@izam.co";

    List<String> emailSplitTitleForm = value.split("@");

    String emailTitle = emailSplitTitleForm[0];

    // HERE we can use dotAll in RegEx also  RegExp(r'^.{8,}$' , dotAll = true).
    List<String> splitFromEmail = emailTitle.split(".");

    String firstPhase = splitFromEmail[0];
    String secondPhase = splitFromEmail.length > 1 ? splitFromEmail[1] : "";

    if (value.trim().isEmpty) {
      return 'Email is Empty';
    } else if (!EmailValidator.validate(value.trim())) {
      return 'Email format is not correct';
    } else if (!_length.hasMatch(value)) {
      return 'Password Must be at least 8 characters in length ';
    } else if (splitFromEmail.length <= 1) {
      return 'Email format must be : $emailForm';
    } else if (!nameRegex.hasMatch(firstPhase)) {
      return 'Email format is not correct : must started with [A-Z]';
    } else if (!numberRegex.hasMatch(secondPhase)) {
      return 'Email format is not correct : must ended with (0-9)';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password!.trim().isEmpty) {
      return 'Password is Empty';
    } else if (!passwordStrongRegEx.hasMatch(password)) {
      return 'Password incorrect: \n should contain at least one upper case [A-Z] \n should contain at least one lower case [a-z] \n should contain at least one digit [0-9] \n should contain at least one Special character [!@#&*~] \n Must be at least 8 characters in length';
    }
    return null;
  }
}
