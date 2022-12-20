import 'package:flutter/material.dart';
import 'package:landing_page/ui/views/about_view.dart';
import 'package:landing_page/ui/views/contact_view.dart';
import 'package:landing_page/ui/views/home_view.dart';
import 'package:landing_page/ui/views/location_view.dart';
import 'package:landing_page/ui/views/pricing_view.dart';
import 'package:landing_page/ui/widgets/custom_app_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: homeBoxDecoration(),
        child: Stack(children: [
          const _HomeBody(),
          //*Custom Menu
          Positioned(
            right: 20,
            top: 20,
            child: CustomAppMenu(),
          ),
        ]),
      ),
    );
  }

  BoxDecoration homeBoxDecoration() => const BoxDecoration(
        gradient: const LinearGradient(
            colors: const [
              Colors.pink,
              Colors.yellow,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.5, 0.5]), //*Define donde empieza el gradiente
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
