import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landing_page/providers/locator.dart';
import 'package:landing_page/router/router.dart';

import 'package:landing_page/utils/scroll.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Landing Page',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      // onGenerateRoute: (routeSettings) =>
      //     Flurorouter.router.generator(routeSettings),

      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}

//*Otra forma de iniciar las rutas

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     Flurorouter.configureRoutes();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Material App',
//         debugShowCheckedModeBanner: false,
//         home: Container());
//   }
// }
