import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// RESPONSE
class FailureServiceWithResponse extends Failure {
  final String error;

  FailureServiceWithResponse({required this.error});
  @override
  List<Object?> get props => [error];
}

// AUTHENTICATION
class FailureServiceValidation extends Failure {
  final String error;

  FailureServiceValidation({required this.error});

  @override
  List<Object?> get props => [error];
}

// LOCAL DATABASE
class FailureEmptyCache extends Failure {
  @override
  List<Object?> get props => [];
}
