import 'package:fluro/fluro.dart';
import 'package:landing_page/router/route_handlers.dart';

//*Rutas
class Flurorouter {
  static final router = new FluroRouter();

  static void configureRoutes() {
    //*Recibe un nombre de la ruta --- vista
    router.define("/:page", handler: homeHandler);

    //*404
    router.notFoundHandler = homeHandler;
  }
}
