import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';

class FontDivider extends StatelessWidget {
  const FontDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      width: 4,
      decoration: BoxDecoration(
        color: Helper.hexToColor('#F5A571'),
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}
