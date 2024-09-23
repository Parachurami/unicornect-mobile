import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/screens/profile_screen.dart';
import 'package:unicornect/app/widgets/tweak/contact_support.dart';
import 'package:unicornect/app/widgets/tweak/following.dart';
import 'package:unicornect/app/widgets/tweak/font.dart';
import 'package:unicornect/app/widgets/tweak/language.dart';
import 'package:unicornect/app/widgets/tweak/personal.dart';

class TweakScreen extends StatelessWidget{
  const TweakScreen({super.key, required this.tweak});
  final Tweak tweak;
  @override
  Widget build(BuildContext context) {
    String title = '';
    Widget content = Container();
    Widget navInfo = Container();
    switch(tweak){
      case Tweak.following:
        title = 'Following';
        content = const Following();
        navInfo = Row(
          children: [
            Image.asset(
              'assets/images/profile_icon_fill.png',
              color: Helper.hexToColor('#7C7C80'),
              width: 18,
            ),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Following 3'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
          ],
        );
        break;
      case Tweak.personal:
        // TODO: Handle this case.
        title = 'Personal Information';
        content = const Personal();
        navInfo = Row(
          children: [
            Image.asset(
              'assets/images/profile_icon_fill.png',
              color: Helper.hexToColor('#7C7C80'),
              width: 18,
            ),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Personal Details'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Personal Information'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
          ],
        );
        break;
      case Tweak.language:
        // TODO: Handle this case.
        title = 'Language';
        content = const Language();
        navInfo = Row(
          children: [
            Image.asset(
              'assets/images/profile_icon_fill.png',
              color: Helper.hexToColor('#7C7C80'),
              width: 18,
            ),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Language'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
          ],
        );
        break;
      case Tweak.contact:
        // TODO: Handle this case.
        title = 'Contact Support';
        content = const ContactSupport();
        navInfo = Row(
          children: [
            Image.asset(
              'assets/images/profile_icon_fill.png',
              color: Helper.hexToColor('#7C7C80'),
              width: 18,
            ),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Contact Support'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
          ],
        );
        break;
      case Tweak.faq:
        // TODO: Handle this case.
        title = "FAQ's";
        break;
      case Tweak.privacy:
        // TODO: Handle this case.
        title = "Privacy Policy";
        break;
      case Tweak.terms:
        // TODO: Handle this case.
        title = "Terms and Conditions";
        break;
      case Tweak.text:
        // TODO: Handle this case.
        title = "Text Size";
        content = const Font();
        navInfo = Row(
          children: [
            Image.asset(
              'assets/images/profile_icon_fill.png',
              color: Helper.hexToColor('#7C7C80'),
              width: 18,
            ),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
            const Text('Text Size'),
            const SizedBox(width: 3,),
            Icon(
              Icons.chevron_right_rounded,
              color: Helper.hexToColor('#7C7C80'),
              size: 20,
            ),
          ],
        );
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 20, top: 9),
              child: navInfo,
            ),
            const SizedBox(height: 20,),
            content,
          ],
        ),
      ),
    );
  }
}