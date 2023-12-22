import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_base_structure/config/constants/api_constants.dart';
import 'package:flutter_base_structure/features/domain/api/singleton/api.dart';
import 'package:flutter_base_structure/features/models/login/login_response.dart';

class InShapeRepository{
  // Singleton instance of the MroRepository class
  static final InShapeRepository _instance = InShapeRepository._internal();

  factory InShapeRepository() => _instance;

  InShapeRepository._internal();

  final API _api = API();

  // ================ SIGN IN

  Future<LoginResponseModel> signIn(String email, String password) async {
    try {
      Map<String, dynamic> data = {APIConstants.email: email, APIConstants.password: password};

      var body = json.encode(data);

      Response response = await _api.sendRequest.post(APIConstants.signIn, data: body);
      Map<String, dynamic> responseData = response.data;
      return LoginResponseModel.fromJson(responseData);
    } catch (ex) {
      rethrow;
    }
  }
}