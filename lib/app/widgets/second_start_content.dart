import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondStartContent extends StatelessWidget{
  const SecondStartContent({super.key, this.onNextPressed, this.onPreviousPressed});
  final void Function()? onNextPressed;
  final void Function()? onPreviousPressed;
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          "Access a fun filled experience!",
          style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "All Input fields provided below are required to be filled provided below are required to be filled",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
        if(height < 1000)
          SizedBox(height: height * 0.315,),
        // const Spacer(),
        Row(
          children: [
            const SizedBox(width: 10,),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black
                ),
                onPressed: onPreviousPressed,
                child:Row(
                  children: [
                    const Icon(Icons.chevron_left),
                    Text(
                      "Previous",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 4,),
                  ],
                )
            ),
            const Spacer(),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black
                ),
                onPressed: onNextPressed,
                child:Row(
                  children: [
                    Text(
                      "Continue",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 4,),
                    const Icon(Icons.chevron_right)
                  ],
                )
            ),
            const SizedBox(width: 10,)
          ],
        )
      ],
    );
  }
}