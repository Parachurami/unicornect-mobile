import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/widgets/home/event_list.dart';
import 'package:unicornect/app/widgets/login/login_input.dart';
// import 'package:encrypt/encrypt.dart' as enc;
// import 'package:crypto/crypto.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentDisplay = SizedBox(
    height: 213.82,
    width: double.infinity,
    child: Center(
      child: Stack(
        children: [
          Positioned(
            left: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/home_arrow.png',
                width: 122.51,
                height: 183,
              )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/home_calendar.png',
                height: 68,
                width: 68,
              ),
              const SizedBox(height: 20,),
              Text(
                'Oops! There are currently no upcoming events on your campus at  the moment',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Helper.hexToColor('#444446')
                ),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    ),
  );

  final List<Event> _availableEvents = [
    Event(
        'assets/images/event_image_1.png',
        'BUSA MET_GALA DINNER 2024',
        DateTime(2024, 6, 1),
        const TimeOfDay(hour: 15, minute: 0),
        [
          User(
              firstName: 'Kaile',
              lastName: 'James',
              username: 'jamkail',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4ssword', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'Jeremy',
              lastName: 'Larry',
              username: 'jewelery',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4sword', iv:iv),
              profileImage: 'assets/images/user_image_2.png'
          ),User(
              firstName: 'King',
              lastName: 'Precious',
              username: 'kingpin',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('dora', iv:iv),
              profileImage: 'assets/images/user_image_3.png'
          ),User(
              firstName: 'Michael',
              lastName: 'Sawyer',
              username: 'sawyer',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('smiths', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'John',
              lastName: 'Doe',
              username: 'john',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('donut', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),
        ]
    ),Event(
        'assets/images/event_image_2.png',
        'GLAM AFFAIR (Celebration of Elegance)',
        DateTime(2024, 5, 18),
        const TimeOfDay(hour: 12, minute: 0),
        [
          User(
              firstName: 'Kaile',
              lastName: 'James',
              username: 'jamkail',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4ssword', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'Jeremy',
              lastName: 'Larry',
              username: 'jewelery',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4sword', iv:iv),
              profileImage: 'assets/images/user_image_2.png'
          ),User(
              firstName: 'King',
              lastName: 'Precious',
              username: 'kingpin',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('dora', iv:iv),
              profileImage: 'assets/images/user_image_3.png'
          ),User(
              firstName: 'Michael',
              lastName: 'Sawyer',
              username: 'sawyer',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('smiths', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'John',
              lastName: 'Doe',
              username: 'john',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('donut', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'John',
              lastName: 'Doe',
              username: 'john',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('donut', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'John',
              lastName: 'Doe',
              username: 'john',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('donut', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),
        ]
    ),Event(
        'assets/images/event_image_3.png',
        'Event in The Day',
        DateTime(2024, 5, 25),
        const TimeOfDay(hour: 13, minute: 0),
        [
          User(
              firstName: 'Kaile',
              lastName: 'James',
              username: 'jamkail',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4ssword', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'Jeremy',
              lastName: 'Larry',
              username: 'jewelery',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('p4sword', iv:iv),
              profileImage: 'assets/images/user_image_2.png'
          ),User(
              firstName: 'King',
              lastName: 'Precious',
              username: 'kingpin',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('dora', iv:iv),
              profileImage: 'assets/images/user_image_3.png'
          ),User(
              firstName: 'Michael',
              lastName: 'Sawyer',
              username: 'sawyer',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('smiths', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),User(
              firstName: 'John',
              lastName: 'Doe',
              username: 'john',
              email: 'jameskaile3@gmail.com',
              password: encrypter.encrypt('donut', iv:iv),
              profileImage: 'assets/images/user_image_1.png'
          ),
        ]
    ),
  ];
  final List<Map<String, dynamic>> _currentEvents = [
    {
      'id':DateTime.now().toString(),
      'image':'assets/images/event_image_1.png',
      'title': 'BUSA MET-GALA DINNER 2024',
      'date':'SAT, JUN 01',
      'time':'3:00 PM',
      'location':'Bells University of Technology',
      'attendees':[
        'assets/images/user_image_1.png',
        'assets/images/user_image_2.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
      ]
    },{
      'id':DateTime.now().toString(),
      'image':'assets/images/event_image_2.png',
      'title': 'GLAM AFFAIR (Celebration of Elegance)',
      'date':'SAT. MAY 18',
      'time':'12:00 PM',
      'location':'Landmark University',
      'attendees':[
        'assets/images/user_image_1.png',
        'assets/images/user_image_2.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_2.png',
        'assets/images/user_image_2.png',
      ]
    },{
      'id':DateTime.now().toString(),
      'image':'assets/images/event_image_3.png',
      'title': 'Even in The Day',
      'date':'SAT. MAY 25',
      'time':'1:00 PM',
      'location':'Bowen University',
      'attendees':[
        'assets/images/user_image_1.png',
        'assets/images/user_image_2.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_3.png',
        'assets/images/user_image_1.png',
        'assets/images/user_image_1.png',
        'assets/images/user_image_1.png',

      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    if(_availableEvents.isNotEmpty){
      currentDisplay = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 36,),


          EventList(events: _availableEvents),
        ],
      );
    }
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'My Location',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Helper.hexToColor('#D9D9D9'),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 168,
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.location_on_outlined,
                            color: Helper.hexToColor('#242426'),
                        ),
                        const SizedBox(width: 4,),
                        Text(
                          'Bells University',
                          style: GoogleFonts.montserrat(
                            color: Helper.hexToColor('#242426'),
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: const Offset(0, 0)
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Colors.white24,
                    child: Center(
                      child:Image.asset(
                          'assets/images/notification_icon.png',
                          height: 24,
                          width: 24,
                      )
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 28,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Helper.hexToColor('#7C7C80'),
                  width: 1
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:(){

                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/search_icon_outline.png',
                      width: 24,
                      height: 24,
                      color: Helper.hexToColor('#7C7C80'),

                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Helper.hexToColor('#7C7C80'),
                      decoration: InputDecoration(
                        hintText: 'Search for events, organizers...',
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Helper.hexToColor('#7C7C80')
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Helper.hexToColor('#0D0D0D')
                      ),
                      child: Center(
                        child: Image.asset(
                            'assets/images/filter_icon.png',
                            height: 24,
                            width: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // const SizedBox(height: 90,),
            currentDisplay
          ],
        ),
      ),
    );
  }
}
