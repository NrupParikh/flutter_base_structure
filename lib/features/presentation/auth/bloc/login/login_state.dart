abstract class LogInState {}

class LoadingState extends LogInState {}

class LogInInitialState extends LogInState {}

class LogInSuccessState extends LogInState {}

class LogInFailureState extends LogInState {
  final String errorMessage;

  LogInFailureState(this.errorMessage);
}
