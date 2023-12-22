import 'package:flutter/material.dart';
import 'package:flutter_base_structure/config/shared_preferences/singleton/inshape_shared_preference.dart';

class InShapeSharedPreferenceProvider extends InheritedWidget {
  final InShapeSharedPreference preference;

  const InShapeSharedPreferenceProvider({
    Key? key,
    required this.preference,
    required Widget child,
  }) : super(key: key, child: child);

  static InShapeSharedPreferenceProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InShapeSharedPreferenceProvider>();
  }

  @override
  bool updateShouldNotify(InShapeSharedPreferenceProvider oldWidget) {
    return preference != oldWidget.preference;
  }
}
