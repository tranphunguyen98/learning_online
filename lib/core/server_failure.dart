class ServerFailure implements Exception {
  String? _message;

  String get message => _message ?? 'Có lỗi xảy ra vui lòng thử lại sau';

  ServerFailure([String? message]) {
    _message = message;
  }
}
