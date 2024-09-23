import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tickets',
        style: GoogleFonts.montserrat(
            fontSize: 20
        ),
      ),
    );
  }
}
