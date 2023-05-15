class BaseFailure implements Exception {
  final String message;
  BaseFailure({required this.message});
}

class BadRequest extends BaseFailure {
  BadRequest({String? message}) : super(message: message ?? 'Bad request');
}

class NotFound extends BaseFailure {
  NotFound({String? message}) : super(message: message ?? 'Not found');
}

class Unauthorized extends BaseFailure {
  Unauthorized({String? message}) : super(message: message ?? 'Unauthorized');
}

class NetworkFailure extends BaseFailure {
  NetworkFailure({String? message})
      : super(message: message ?? 'Network failure');
}

class InternalFailure extends BaseFailure {
  InternalFailure({String? message})
      : super(message: message ?? 'Internal failure');
}
