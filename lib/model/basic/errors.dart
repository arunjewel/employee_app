class Errors {
  late String _code;
  late String _message;

  String get code => _code;
  String get message => _message;

  Errors({
    String? code,
    String? message}){
    _code = code!;
    _message = message!;
  }

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
  factory Errors.unknownError(String message, {String? code}) {
    return Errors(
      message: message,
      code: 'unknown_error',
    );
  }
  factory Errors.networkError() {
    return Errors(
      message: 'Please check your internet connection',
      code: 'network_error',
    );
  }
}