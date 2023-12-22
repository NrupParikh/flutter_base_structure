import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/config/constants/string_constants.dart';
import 'package:flutter_base_structure/config/shared_preferences/provider/inshape_shared_preference_provider.dart';
import '../../../../config/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    // Set 3 second timer for Splash Screen
    Timer(const Duration(seconds: AppConstants.splashTimeOut), () {
      final pref = InShapeSharedPreferenceProvider.of(context)?.preference;
      var isLogin = pref?.getBool(AppConstants.prefKeyIsLoggedIn);
      if (isLogin == true) {
        Navigator.pushReplacementNamed(context, AppConstants.routeHome);
      } else {
        Navigator.pushReplacementNamed(context, AppConstants.routeLogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenUI();
  }
}

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Center(
                child: Image.asset("assets/images/img_splash.jpg", fit: BoxFit.fill),
              ),
              const Center(
                child: Text(StringConstants.titleSplashScreen,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
