import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:landing_page/providers/menu_provider.dart';

//* Riverpod Hooks para utilizar useAnimationController
class CustomAppMenu extends HookConsumerWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuValue = ref.watch(menuProvider);
    //**Constrollador de la animacion */
    late final controller =
        useAnimationController(duration: Duration(milliseconds: 200));

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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: menuValue.isOpen ? 50 : 0,
              ),
              Text(
                "Menu",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Spacer(),

              //*Icono Animado
              AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: controller,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
