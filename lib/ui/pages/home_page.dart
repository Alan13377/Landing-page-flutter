import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:landing_page/providers/page_provider.dart';
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
        // ignore: prefer_const_literals_to_create_immutables
        child: Stack(children: [
          const _HomeBody(),
          //*Custom Menu
          const Positioned(
            right: 20,
            top: 20,
            child: CustomAppMenu(),
          ),
        ]),
      ),
    );
  }

  BoxDecoration homeBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.yellow,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]), //*Define donde empieza el gradiente
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return PageView(
          controller: ref.watch(controllerProvider).scrollController,
          scrollDirection: Axis.vertical,
          children: const [
            HomeView(),
            AboutView(),
            PricingView(),
            ContactView(),
            LocationView(),
          ],
        );
      },
    );
  }
}
