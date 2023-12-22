import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_structure/config/constants/string_constants.dart';
import 'package:flutter_base_structure/config/exception_handling/api_error.dart';
import 'package:flutter_base_structure/config/exception_handling/api_exception_response.dart';
import 'package:flutter_base_structure/config/shared_preferences/singleton/inshape_shared_preference.dart';
import 'package:flutter_base_structure/features/domain/repository/singleton/inshape_repository.dart';
import 'package:flutter_base_structure/features/models/login/login_response.dart';
import 'package:flutter_base_structure/features/presentation/auth/bloc/login/login_state.dart';
import 'dart:convert';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitialState());

  void submitForm(
      String email, String password, InShapeRepository repository, InShapeSharedPreference pref, bool isOnline) async {
    if (email.isEmpty) {
      emit(LogInFailureState(StringConstants.valMsgEnterEmail));
    } else if (password.isEmpty) {
      emit(LogInFailureState(StringConstants.valMsgEnterPassword));
    } else if (!isOnline) {
      emit(LogInFailureState(StringConstants.mgsNoInternet));
    } else {
      try {
        emit(LoadingState());
        final LoginResponseModel data = await repository.signIn(email, password);

        if (data.result == 1) {
          emit(LogInSuccessState());
        } else {
          emit(LogInFailureState(data.message.toString()));
        }
      } on DioException catch (ex) {
        if (ex.response != null && ex.response!.data != null) {
          final ApiExceptionResponse apiExceptionResponse = ApiExceptionResponse.fromJson(ex.response!.data);
          emit(LogInFailureState(apiExceptionResponse.message.toString()));
        } else {
          emit(LogInFailureState(apiError(ex)));
        }
      }
    }
  }
}
