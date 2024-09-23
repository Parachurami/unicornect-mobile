import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';

class EventDateTimeDetail extends StatelessWidget{
  const EventDateTimeDetail({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Helper.hexToColor('#F5A571'),
          size: 24,
        ),
        const SizedBox(width: 4,),
        Text(
          title,
          style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}