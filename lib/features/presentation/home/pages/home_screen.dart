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
  static const keyLogoutButton = "logout_button";

  @override
  Widget build(BuildContext context) {
    final pref = InShapeSharedPreferenceProvider.of(context)?.preference;

    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.titleHomeScreen), backgroundColor: Colors.tealAccent),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const Text(StringConstants.titleHomeScreen,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    key: const Key(keyLogoutButton),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.tealAccent)),
                    onPressed: () {
                      displayDialog(pref!, context);
                    },
                    child: const Text(
                      StringConstants.lblLogin,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
              ],
            ),
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
