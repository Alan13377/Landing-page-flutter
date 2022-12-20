import 'package:fluro/fluro.dart';
import 'package:landing_page/ui/pages/home_page.dart';

//*Vistas y Pages
final homeHandler = Handler(handlerFunc: (context, params) {
  return HomePage();
});
