import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatefulWidget {
  const NavItem({super.key, required this.icon, required this.label, required this.onTap, required this.color});
  final String icon;
  final String label;
  final void Function()? onTap;
  final Color color;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.icon,
            color: widget.color,
            height: 20,
          ),
          Text(
            widget.label,
            style: GoogleFonts.montserrat(
              color: widget.color,
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}
