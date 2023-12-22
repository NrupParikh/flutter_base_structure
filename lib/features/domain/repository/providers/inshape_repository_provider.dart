import 'package:flutter/material.dart';
import 'package:flutter_base_structure/features/domain/repository/singleton/inshape_repository.dart';

class InShapeRepositoryProvider extends InheritedWidget {
  final InShapeRepository repository;

  const InShapeRepositoryProvider({
    Key? key,
    required this.repository,
    required Widget child,
  }) : super(key: key, child: child);

  static InShapeRepositoryProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InShapeRepositoryProvider>();
  }

  @override
  bool updateShouldNotify(InShapeRepositoryProvider oldWidget) {
    return repository != oldWidget.repository;
  }
}
