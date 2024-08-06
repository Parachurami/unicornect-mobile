import 'package:flutter/material.dart';

class ProgressBarItem extends StatelessWidget{
  const ProgressBarItem({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color
      ),
    );
  }
}