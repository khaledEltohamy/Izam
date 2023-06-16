import '../../utils/constant/massage.dart';
import 'failure.dart';

class ErrorModel {
  final String title;
  final String contact;

  ErrorModel({required this.title, required this.contact});

  factory ErrorModel.convertFailureError(Failure failure) {
    if (failure is FailureServiceWithResponse) {
      return ErrorModel(title: "".defaultMsg, contact: failure.error);
    }
    if (failure is FailureServiceValidation) {
      return ErrorModel(title: "".validationMsg, contact: failure.error);
    }
    if (failure is FailureEmptyCache) {
      return ErrorModel(title: "".databaseMsg, contact: "");
    } else {
      return ErrorModel(
          title: "".defaultMsg,
          contact: "Some thing went wrong please try agin later.");
    }
  }
}
