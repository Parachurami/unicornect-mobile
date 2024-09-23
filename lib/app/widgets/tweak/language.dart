import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';


enum Languages{
  english,
  pidgin,
  french
}
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  var currentLanguage = Languages.english;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Please select your preferred language',
            style: TextStyle(
                color: Helper.hexToColor('#7C7C80')
            ),
          ),
        ),
        const SizedBox(height: 32,),
        RadioListTile(
          title: const Text('English',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          activeColor: Colors.black,
          value: Languages.english,
          groupValue: currentLanguage,
          onChanged: (value) {
            setState(() {
              currentLanguage = value!;
            });
          },
        ),
        // const SizedBox(height: 10,),
        RadioListTile(
          title: const Text('Pidgin',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
          activeColor: Colors.black,
          value: Languages.pidgin,
          groupValue: currentLanguage,
          onChanged: (value) {
            setState(() {
              currentLanguage = value!;
            });
          },
        ),
        // const SizedBox(height: 10,),
        RadioListTile(
          title: const Text('Francais',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
          activeColor: Colors.black,
          value: Languages.french,
          groupValue: currentLanguage,
          onChanged: (value) {
            setState(() {
              currentLanguage = value!;
            });
          },
        ),
        const SizedBox(height: 24,),
      ],
    );
  }
}
