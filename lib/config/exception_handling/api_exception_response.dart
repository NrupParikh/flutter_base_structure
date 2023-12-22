class ApiExceptionResponse {
  int? result;
  int? statusCode;
  String? message;
  String? errorCode;

  ApiExceptionResponse({this.result, this.statusCode, this.message, this.errorCode});

  ApiExceptionResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    statusCode = json['statusCode'];
    message = json['message'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['errorCode'] = errorCode;
    return data;
  }
}
