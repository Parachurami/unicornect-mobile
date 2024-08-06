import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/widgets/progress_bar_item.dart';

class ProgressBar extends StatefulWidget{
  const ProgressBar({super.key, required this.index});
  final int index;

  @override
  State<ProgressBar> createState() {
    return _ProgressBarState();
  }
}

class _ProgressBarState extends State<ProgressBar>{
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Row(
      children: [
        const ProgressBarItem(
          color: Colors.black,
        ),
        const Spacer(),
        ProgressBarItem(
            color: widget.index > 0 ? Colors.black : Helper.hexToColor('#D9D9D9')
        ),
        const Spacer(),
        ProgressBarItem(
            color: widget.index > 1 ? Colors.black : Helper.hexToColor('#D9D9D9')
        ),
      ],
    );
  }
}