import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatelessWidget{
  const SubmitButton({super.key, required this.title, required this.backgroundColor, this.width, this.horizontalPadding, this.verticalPadding, required this.onPressed});
  final String title;
  final Color backgroundColor;
  final double? width;
  final double? horizontalPadding;
  final double? verticalPadding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width ?? 350,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                )
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: horizontalPadding ?? 91, vertical: verticalPadding ?? 20)),
            backgroundColor:onPressed == null ? WidgetStatePropertyAll(Colors.black.withOpacity(0.5)) : WidgetStatePropertyAll(backgroundColor),
          ),
          onPressed: onPressed,
          child: Text(title,
            style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 16
            ),
          )
      ),
    );
  }
}