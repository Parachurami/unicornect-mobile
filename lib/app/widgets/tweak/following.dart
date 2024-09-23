import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';

class Following extends StatelessWidget{
  const Following({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 20, top: 9),
          child: Text(
            'Follow event organizers to get notified whenever they have an upcoming event',
            style: TextStyle(
              color: Helper.hexToColor('#7C7C80')
            ),
          ),
        ),
        const SizedBox(height: 28,),
        const ListTile(
          subtitle: Text('Organiser'),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/organiser_image_2.png'),
          ),
          trailing: Text('Following',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
          title: Text(
            'BUSA Team',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
        ),
        const SizedBox(height: 28,),
        const ListTile(
          subtitle: Text('Organiser'),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/organiser_image_3.png'),
          ),
          trailing: Text('Following',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
          title: Text(
            'Double G',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),
          ),
        ),
        const SizedBox(height: 28,),
        const ListTile(
          subtitle: Text('Organiser'),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white38,
            backgroundImage: AssetImage('assets/images/organiser_image_4.png'),
          ),
          trailing: Text('Following',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
          ),
          title: Text(
            'Mikez Promotion',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 28,),
      ],
    );
  }
}