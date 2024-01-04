//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/config/constants/app_constants.dart';
import 'package:flutter_base_structure/config/constants/string_constants.dart';
import 'package:flutter_base_structure/config/shared_preferences/provider/inshape_shared_preference_provider.dart';
import 'package:flutter_base_structure/features/domain/repository/providers/inshape_repository_provider.dart';
import 'package:flutter_base_structure/features/presentation/auth/bloc/login/login_cubit.dart';
import 'package:flutter_base_structure/features/presentation/auth/bloc/login/login_state.dart';
import 'package:flutter_base_structure/features/widgets/my_custom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. Unit Testing
// 2. UI Testing
// 3. Integration Testing
// Reference : https://medium.com/mindful-engineering/getting-started-with-writing-test-cases-in-flutter-d5f432c4e680

GlobalKey<State> _dialogKey = GlobalKey<State>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailAddressController = TextEditingController(text: "nrup@gmail.com");
  final passwordController = TextEditingController(text: "Test@123");

  // Keys
  static const keyEmail = "email";
  static const keyPassword = "password";
  static const keyLoginButton = "login_button";

  @override
  void initState() {
    super.initState();
    emailAddressController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LogInCubit logInCubit = context.read<LogInCubit>();
    final pref = InShapeSharedPreferenceProvider.of(context)?.preference;
    debugPrint("TAG_PREF_LOGIN ${pref?.getBool(AppConstants.prefKeyIsLoggedIn)}");

   // Connectivity connectivity = Connectivity();

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.titleLoginScreen),
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: BlocConsumer<LogInCubit, LogInState>(
          listenWhen: (context, state) {
            return state is LogInSuccessState || state is LogInFailureState || state is LoadingState;
          },
          listener: (context, state) {
            if (state is LogInSuccessState) {
              pref?.setBool(AppConstants.prefKeyIsLoggedIn, true);
              pref?.setString(AppConstants.prefKeyEmail, emailAddressController.text);
              hideLoading(_dialogKey);
              // Remove Auth Flow from Stack and Move to Home
              Navigator.pushNamedAndRemoveUntil(context, AppConstants.routeHome, (route) => false);
            } else if (state is LogInFailureState) {
              // Must Hide Loading before failure action performed
              hideLoading(_dialogKey);
              displayDialog(context, state.errorMessage);
            } else if (state is LoadingState) {
              showLoading(context, _dialogKey);
            }
          },
          buildWhen: (context, state) {
            return state is LogInInitialState;
          },
          builder: (context, state) {
            if (state is LogInInitialState) {
              // Getting Access of Mro Repository singleton instance
              final inShapeRepository = InShapeRepositoryProvider.of(context)?.repository;
              return SizedBox(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      key: const Key(keyEmail),
                      controller: emailAddressController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: StringConstants.lblEmail),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      key: const Key(keyPassword),
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: StringConstants.lblPassword),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 48.0,
                      width: 300.0,
                      child: ElevatedButton(
                          key: const Key(keyLoginButton),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.tealAccent)),
                          onPressed: () async {
                            logInCubit.submitForm(
                                emailAddressController.text, passwordController.text, inShapeRepository!, pref!, true);
                            // await connectivity.checkConnectivity().then((value) {
                            //   if (value == ConnectivityResult.none) {
                            //     logInCubit.submitForm(
                            //         emailAddressController.text, passwordController.text, inShapeRepository!, pref!, false);
                            //   } else {
                            //
                            //   }
                            // });
                          },
                          child: const Text(
                            StringConstants.lblLogin,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                          )),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  void displayDialog(BuildContext context, String message) {
    var dialog = MyCustomAlertDialog(
      title: AppConstants.appName,
      description: message,
      onOkButtonPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      onCancelButtonPressed: () {},
      hasCancelButton: false,
    );

    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
