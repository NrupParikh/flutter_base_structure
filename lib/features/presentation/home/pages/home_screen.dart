import 'package:flutter/material.dart';
import 'package:flutter_base_structure/config/constants/app_constants.dart';
import 'package:flutter_base_structure/config/constants/string_constants.dart';
import 'package:flutter_base_structure/config/shared_preferences/provider/inshape_shared_preference_provider.dart';
import 'package:flutter_base_structure/config/shared_preferences/singleton/inshape_shared_preference.dart';
import 'package:flutter_base_structure/features/widgets/my_custom_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final pref = InShapeSharedPreferenceProvider.of(context)?.preference;
    final email = pref?.getString(AppConstants.prefKeyEmail);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.titleHomeScreen),
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
              onPressed: () {
                displayDialog(pref!, context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Text("Welcome $email !",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
          )),
    );
  }

  void displayDialog(InShapeSharedPreference pref, BuildContext context) {
    var dialog = MyCustomAlertDialog(
      title: AppConstants.appName,
      description: StringConstants.msgLogoutConfirmation,
      onOkButtonPressed: () {
        performLogout(pref, context);
      },
      onCancelButtonPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      hasCancelButton: true,
    );

    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  // ====================== LOGOUT
  void performLogout(InShapeSharedPreference pref, BuildContext context) {
    pref.clear();
    Navigator.pushNamedAndRemoveUntil(context, AppConstants.routeLogin, (route) => false);
  }
}
