import 'package:fluro/fluro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:landing_page/router/router_handlers.dart';

//*Rutas
class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    //*Recibe un nombre de la ruta --- vista
    router.define('/:page', handler: homeHandler);

    //*404
    router.notFoundHandler = homeHandler;
  }
}
