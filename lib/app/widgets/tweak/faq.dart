import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          title: Text('What is UniCornect',
            style: TextStyle(
              fontSize: 16
            ),
          )
        ),
        ExpansionTile(
            title: Text('How do I change my usename?',
              style: TextStyle(
                  fontSize: 16
              ),
            )
        ),
        ExpansionTile(
            title: Text('Can I cancel my ticket after I’ve paid for it?',
              style: TextStyle(
                  fontSize: 16
              ),
            )
        ),
        ExpansionTile(
            title: Text('Where can I see my saved events?',
              style: TextStyle(
                  fontSize: 16
              ),
            )
        ),
      ],
    );
  }
}
