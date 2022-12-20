import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerProvider = Provider((ref) => PageProvider());

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
