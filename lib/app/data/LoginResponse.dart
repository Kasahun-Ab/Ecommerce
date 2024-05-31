
import 'package:pazimo/app/data/user.dart';

class LoginResponse {
  final bool success;
  final String message;
  final int status;
  final User user;
  final String token;

  LoginResponse({
    required this.success,
    required this.message,
    required this.status,
    required this.user,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      status: json['status'],
      user: User.fromJson(json['data']['user']),
      token: json['data']['token'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'status': status,
      'data': {
        'user': user.toJson(),
        'token': token,
      }
      };
      }
}

class ErrorResponse {
  final bool success;
  final String message;
  final int status;
  final ErrorData data;

  ErrorResponse({
    required this.success,
    required this.message,
    required this.status,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      success: json['success'],
      message: json['message'],
      status: json['status'],
      data: ErrorData.fromJson(json['data']),
    );
  }
}

class ErrorData {
  final bool success;
  final String message;
  final int status;
  final String exceptionMessage;
  final Map<String, List<String>> errors;

  ErrorData({
    required this.success,
    required this.message,
    required this.status,
    required this.exceptionMessage,
    required this.errors,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) {
    return ErrorData(
      success: json['success'],
      message: json['message'],
      status: json['status'],
      exceptionMessage: json['exception_message'],
      errors: (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }
}
