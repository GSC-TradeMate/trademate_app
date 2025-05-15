import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademate_app/theme/palette.dart';

class ButtonSolid extends StatelessWidget {
  final Widget? child;
  final Color? bgColor;
  final Color? textColor;
  final Size? fixedSize;
  final double? radius;
  final bool? isLoad;
  final void Function()? onPressed;
  const ButtonSolid({
    super.key,
    this.child,
    this.bgColor = Palette.primaryDef,
    this.textColor = Palette.white,
    this.fixedSize,
    this.radius = 12,
    this.onPressed,
    this.isLoad,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledForegroundColor: Palette.grey,
        disabledBackgroundColor: Palette.disabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
        ),
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: textColor,
        fixedSize: fixedSize,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onPressed,
      child: isLoad ?? false
          ? SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              ),
            )
          : child,
    );
  }
}
