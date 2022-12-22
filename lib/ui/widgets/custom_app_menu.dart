import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:landing_page/providers/menu_provider.dart';
import 'package:landing_page/providers/page_provider.dart';
import 'package:landing_page/ui/widgets/custom_menu_item.dart';

//* Riverpod Hooks para utilizar useAnimationController
class CustomAppMenu extends HookConsumerWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuValue = ref.watch(menuProvider);
    //**Constrollador de la animacion */
    late final controller =
        useAnimationController(duration: Duration(milliseconds: 200));

    final navigation = ref.watch(controllerProvider);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          menuValue.isOpen = !menuValue.isOpen;
          //*Animacion dependiendo del bool

          if (menuValue.isOpen) {
            controller.forward();
          } else {
            controller.reverse();
          }
        },
        //*Contendor del Menu
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: menuValue.isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(menuValue: menuValue, controller: controller),
              if (menuValue.isOpen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'Home',
                    onPressed: () => navigation.goTo(0)),
                CustomMenuItem(
                    delay: 30,
                    text: 'About',
                    onPressed: () => navigation.goTo(1)),
                CustomMenuItem(
                    delay: 60,
                    text: 'Pricing',
                    onPressed: () => navigation.goTo(2)),
                CustomMenuItem(
                    delay: 90,
                    text: 'Contact',
                    onPressed: () => navigation.goTo(3)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Location',
                    onPressed: () => navigation.goTo(4)),
                SizedBox(height: 8)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.menuValue,
    required this.controller,
  }) : super(key: key);

  final MenuProvider menuValue;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: menuValue.isOpen ? 43 : 0,
          ),
          Text(
            "Menú",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),

          //*Icono Animado
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
