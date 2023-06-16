// SERVER
class ExceptionServiceCallBack implements Exception {
  final String massage;

  ExceptionServiceCallBack({required this.massage});
}

// AUTHORIZED
class ExceptionServiceAuthentication implements Exception {
  final String error;
  ExceptionServiceAuthentication({required this.error});
}

//LOCAL DATA BASE
class ExceptionEmptyCache implements Exception {}
