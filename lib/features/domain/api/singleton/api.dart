import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  // Singleton instance of the API class
  static final API _instance = API._internal();

  factory API() => _instance;

  API._internal() {
    _dio.options.baseUrl = "http://4.236.153.88/api/v1/";
    _dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true));
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.followRedirects = false;


  }

  final Dio _dio =    Dio();

  Dio get sendRequest =>   _dio;
}
