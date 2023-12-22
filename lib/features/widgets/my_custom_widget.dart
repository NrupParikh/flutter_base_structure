import 'package:flutter/material.dart';
import 'package:flutter_base_structure/config/constants/app_constants.dart';
import '../../config/constants/string_constants.dart';

// ================ COMMON BUTTON WITH FULL WIDTH
class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonBgColor;
  final double leftPadding;
  final double rightPadding;

  const CustomElevatedButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonBgColor,
      required this.leftPadding,
      required this.rightPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonBgColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// ================ ALERT DIALOG WITH OK BUTTON

class MyCustomAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onOkButtonPressed;
  final VoidCallback onCancelButtonPressed;
  final bool hasCancelButton;

  const MyCustomAlertDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.onOkButtonPressed,
      required this.onCancelButtonPressed,
      required this.hasCancelButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        if (hasCancelButton) ...[
          TextButton(onPressed: onCancelButtonPressed, child: const Text(AppConstants.cancel)),
        ],
        TextButton(onPressed: onOkButtonPressed, child: const Text(AppConstants.ok))
      ],
    );
  }
}

// =============== SHOW AND HIDE LOADING

void showLoading(BuildContext context, GlobalKey<State<StatefulWidget>> dialogKey) {
  showDialog(
    context: context,
    barrierDismissible: false,
    // Prevent the user from dismissing the dialog with a tap outside
    builder: (BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      return AlertDialog(
        key: dialogKey,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
            child: SizedBox(width: screenWidth, height: screenHeight, child: const Center(child: CircularProgressIndicator()))),
      );
    },
  );
}

void hideLoading(GlobalKey<State<StatefulWidget>> dialogKey) {
  if (dialogKey.currentContext != null) {
    Navigator.of(dialogKey.currentContext!).pop();
  }
}

// ========= No Internet Snack Bar
void noInternetMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(StringConstants.mgsNoInternet),
      duration: Duration(seconds: 2),
    ),
  );
}
