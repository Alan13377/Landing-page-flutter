import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuProvider = ChangeNotifierProvider((ref) => MenuProvider());

class MenuProvider extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  set isOpen(bool isOpen) {
    _isOpen = isOpen;
    notifyListeners();
  }
}
