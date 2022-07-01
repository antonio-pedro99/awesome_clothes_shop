import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeautfulButton extends StatelessWidget {
  const BeautfulButton(
      {Key? key, this.label, this.reversed = false, this.onPress})
      : super(key: key);

  final String? label;
  final bool? reversed;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: onPress,
        child: Container(
            height: 65,
            width: 165,
            decoration: BoxDecoration(
                color: !reversed! ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(label!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                        color: !reversed! ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)))));
  }
}
