class AppException implements Exception {
  final message;
  final errorCode;
  final prefix;
  
  AppException([this.errorCode, this.message, this.prefix]);

  String toString(){
    return "$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({int errorCode = 0, String message = ""}) : super(errorCode, message, "Error During Communication: ");
}

//400
class BadRequestException extends AppException {
  BadRequestException({int errorCode = 400,String message = ""}) : super(errorCode, message, "Invalid Request: ");
}

//
class UnauthorizedException extends AppException {
  UnauthorizedException({int errorCode = 0, String message = ""}): super(errorCode, message, "Unauthorized: ");
}

//422
class ValidationException extends AppException {
  ValidationException({int errorCode = 422, String message = ""}): super(errorCode, message, "Invalid Input: ");
}

//401
class MissingTokenException extends AppException {
  MissingTokenException({int errorCode = 401, String message = ""}): super(errorCode, message, "Missing Token Or Inactive User: ");
}

//403
class ForbiddenException extends AppException {
  ForbiddenException({int errorCode = 403, String message = ""}): super(errorCode, message, "Missing Token Or Inactive User: ");
}

//500
class InternalException extends AppException {
  InternalException({int errorCode = 500, String message = ""}): super(errorCode, message, "Missing Token Or Inactive User: ");
}

class TimeOutException extends AppException {
  TimeOutException({int errorCode = 0,String message = ''}): super(errorCode,message,'Connection time out');
}