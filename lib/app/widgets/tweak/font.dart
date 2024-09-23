import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/widgets/tweak/font/font_divider.dart';

class Font extends StatefulWidget {
  const Font({super.key});

  @override
  State<Font> createState() => _FontState();
}

class _FontState extends State<Font> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    print(_currentSliderValue);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 30),
          child: Text(
            'Increase your text size according to your preference',
            style: TextStyle(
              color: Helper.hexToColor('#7C7C80'),
              fontSize: 14 + _currentSliderValue
            ),
          ),
        ),
        const SizedBox(height: 41,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('A',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(width: 8,),
            SizedBox(
              width: 308,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.none,
                        width:double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Helper.hexToColor('#F4D1B9'),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 20,),
                          FontDivider(),
                          SizedBox(width: 50,),
                          FontDivider(),
                          SizedBox(width: 48,),
                          FontDivider(),
                          SizedBox(width: 48,),
                          FontDivider(),
                          SizedBox(width: 48,),
                          FontDivider(),
                          SizedBox(width: 48,),
                          FontDivider(),
                          SizedBox(width: 20,),
                        ],
                      )
                    ],
                  ),
                  Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 10,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                    thumbColor: Helper.hexToColor('#ffffff'),
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    allowedInteraction: SliderInteraction.tapAndSlide,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8,),
            const Text('A',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            )
          ],
        ),
      ],
    );
  }
}
