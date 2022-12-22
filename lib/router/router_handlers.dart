import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:landing_page/providers/locator.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;
    if (page != '/') {
      locator<PageProvider>().createScrollController(page);

      return const HomePage();
    }
  },
);
