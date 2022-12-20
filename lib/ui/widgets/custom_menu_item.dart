import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomMenuItem extends HookConsumerWidget {
  final String text;
  final Function onPressed;
  final int delay;
  const CustomMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = useState(Colors.transparent);
    //*Detectar el mouse
    return BounceInDown(
      delay: Duration(milliseconds: 200),
      child: MouseRegion(
        onEnter: (value) {
          textColor.value = Colors.pinkAccent;
        },
        onExit: (value) {
          textColor.value = Colors.transparent;
        },
        child: GestureDetector(
          onTap: () => onPressed(),
          child: AnimatedContainer(
            width: 150,
            height: 50,
            duration: const Duration(milliseconds: 300),
            color: textColor.value,
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

// class CustomMenuItem extends StatefulWidget {
//   final String text;
//   final Function onPressed;
//   final int delay;

//   const CustomMenuItem(
//       {Key? key, required this.text, required this.onPressed, this.delay = 0})
//       : super(key: key);

//   @override
//   _CustomMenuItemState createState() => _CustomMenuItemState();
// }

// class _CustomMenuItemState extends State<CustomMenuItem> {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHover = true),
//       onExit: (_) => setState(() => isHover = false),
//       child: GestureDetector(
//         onTap: () => widget.onPressed(),
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           width: 150,
//           height: 50,
//           color: isHover ? Colors.pinkAccent : Colors.transparent,
//           child: Center(
//             child: Text(widget.text,
//                 style: GoogleFonts.roboto(fontSize: 20, color: Colors.white)),
//           ),
//         ),
//       ),
//     );
//   }
// }
