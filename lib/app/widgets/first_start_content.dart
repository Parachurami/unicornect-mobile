import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstStartContent extends StatelessWidget{
  const FirstStartContent({super.key, this.onNextPressed});
  // final AnimationController controller;
  final void Function()? onNextPressed;

  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    print(height);
    return Column(
      children: [
        Text(
          "Never miss an event on Campus",
          style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16,),
        Text(
          "Be one of the first set students to get notified when there’s an event coming up on campus",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400
          ),
        ),
        if(height < 1000)
          SizedBox(height: height * 0.35,),
        // const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black
                ),
                onPressed: onNextPressed,
                child:Row(
                  children: [
                    Text(
                      "Next",
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
        ),
      ],
    );
  }
}