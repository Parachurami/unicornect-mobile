import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/providers/bookmark_provider.dart';
import 'package:unicornect/app/screens/selection_detail.dart';
import 'package:unicornect/app/widgets/event_detail/ticket_selection.dart';
import 'package:unicornect/app/widgets/home/event_date_time_detail.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class EventDetailScreen extends ConsumerStatefulWidget{
  const EventDetailScreen(this.event, {super.key});
  final Event event;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _EventDetailScreenState();
  }

}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen>{
  final recognizer = TapGestureRecognizer();
  @override
  void initState() {
    // TODO: implement initState
    recognizer.onTap = (){
      print('more tapped');
    };
    super.initState();
  }

  void showShareModal(){
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.only(left: 37, right: 36, top: 28, bottom: 84),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Share with:',
              style: TextStyle(
                color: Helper.hexToColor('#242426'),
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Helper.hexToColor('#0000FF'),
                        shape: const CircleBorder(

                        )
                      ),
                      onPressed: (){},
                      icon: Icon(Icons.link_rounded,
                        color: Helper.hexToColor('#FFFFFF'),
                        size: 20,
                      )
                    ),
                    Text('Copy Link',
                      style: TextStyle(
                        color: Helper.hexToColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Helper.hexToColor('#3D5A98'),
                        shape: const CircleBorder(

                        )
                      ),
                      onPressed: (){},
                      icon: Image.asset('assets/images/devicon_facebook.png',
                        width: 20,
                        // color: Helper.hexToColor('#3D5A98'),
                      )
                    ),
                    Text('Facebook',
                      style: TextStyle(
                        color: Helper.hexToColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Helper.hexToColor('#2AABEE'),
                        shape: const CircleBorder(

                        )
                      ),
                      onPressed: (){},
                      icon: Image.asset('assets/images/logos_telegram.png',
                        width: 20,
                        // color: Helper.hexToColor('#3D5A98'),
                      )
                    ),
                    Text('Telegram',
                      style: TextStyle(
                        color: Helper.hexToColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Helper.hexToColor('#0D0D0D'),
                        shape: const CircleBorder(

                        )
                      ),
                      onPressed: (){},
                      icon: Image.asset('assets/images/mage_x.png',
                        width: 20,
                        // color: Helper.hexToColor('#3D5A98'),
                      )
                    ),
                    Text('Twitter',
                      style: TextStyle(
                        color: Helper.hexToColor('#000000'),
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Helper.hexToColor('#F6F0E9'),
                            shape: const CircleBorder(

                            )
                        ),
                        onPressed: (){},
                        icon: Image.asset('assets/images/snapchat_icon.png',
                          width: 20,
                          // color: Helper.hexToColor('#3D5A98'),
                        )
                    ),
                    Text('Snapchat',
                      style: TextStyle(
                          color: Helper.hexToColor('#000000'),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Helper.hexToColor('#3D5A98'),
                            shape: const CircleBorder(

                            )
                        ),
                        onPressed: (){},
                        icon: Image.asset('assets/images/devicon_facebook.png',
                          width: 20,
                          // color: Helper.hexToColor('#3D5A98'),
                        )
                    ),
                    Text('Stories',
                      style: TextStyle(
                          color: Helper.hexToColor('#000000'),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Helper.hexToColor('#F6F0E9'),
                            shape: const CircleBorder(

                            )
                        ),
                        onPressed: (){},
                        icon: Image.asset('assets/images/skill-icons_instagram.png',
                          width: 20,
                          // color: Helper.hexToColor('#3D5A98'),
                        )
                    ),
                    Text('Instagram',
                      style: TextStyle(
                          color: Helper.hexToColor('#000000'),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Helper.hexToColor('#F6F0E9'),
                            shape: const CircleBorder(

                            )
                        ),
                        onPressed: (){},
                        icon: Image.asset('assets/images/snapchat_icon.png',
                          width: 20,
                          // color: Helper.hexToColor('#3D5A98'),
                        )
                    ),
                    Text('Stories',
                      style: TextStyle(
                          color: Helper.hexToColor('#000000'),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      enableDrag: true,
      backgroundColor: Helper.hexToColor('#FFFFFF')
    );
  }

  List<Map<String, String>> options = [
    {
      'tableType':'Table of 4 (VIP)',
      'amount':'34000'
    },
    {
      'tableType':'VIP (VIP)',
      'amount':'8500'
    },
    {
      'tableType':'Table of 8 (Regular)',
      'amount':'40000'
    },
    {
      'tableType':'Regular (Single)',
      'amount':'5000'
    },
  ];

  Map<String, String>? currentOption;
  String formattedPrice(double price){
    final priceNumber = price.toInt().toString();
    print(priceNumber);
    List<String> strPrice = priceNumber.split('').reversed.toList();
    List<String> priceString = [];
    int counter = 0;
    for(int i = 0; i < strPrice.length; i++){
      counter++;
      priceString.add(strPrice[i]);
      if(counter % 3 == 0) priceString.add(',');
    }
    final resultList = priceString.reversed.toList();
    String result = '';
    for(String s in resultList){
      result += s;
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    final bookmarkProv = ref.watch(bookmarkProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title,
          style: TextStyle(
            fontSize: 16,
            color: Helper.hexToColor('#0D0D0D'),
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 281),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.home_rounded),
                const SizedBox(width: 9,),
                const Icon(Icons.chevron_right_rounded),
                const SizedBox(width: 12,),
                Text(widget.event.title,
                  style: TextStyle(
                    color: Helper.hexToColor('#242426'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 38,),
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 258,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Hero(
                    tag: widget.event.id,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      widget.event.image,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: IconButton(
                    onPressed: showShareModal,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white
                    ),
                    icon: Icon(
                      Icons.share_outlined,
                      color: Helper.hexToColor('#0D0D0D'),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(height: 23,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(widget.event.title,
                    style: TextStyle(
                      color: Helper.hexToColor('#242426'),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                IconButton(
                    onPressed: (){
                      if(bookmarkProv.isBookmarked(widget.event)){
                        setState(() {
                          bookmarkProv.removeFromBookMark(widget.event);
                        });
                        toastification.show(
                          autoCloseDuration: const Duration(seconds: 5),
                          animationDuration: const Duration(milliseconds: 500),
                          showProgressBar: false,
                          context: context,
                          title: Text(
                            'Event unsaved Successfully',
                            style: GoogleFonts.montserrat(
                                color: Helper.hexToColor('#149E14'),
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          style: ToastificationStyle.minimal,
                          primaryColor: Helper.hexToColor('#FF8C40'),
                          type: ToastificationType.success,
                        );
                      }else{
                        toastification.show(
                          autoCloseDuration: const Duration(seconds: 5),
                          animationDuration: const Duration(milliseconds: 500),
                          showProgressBar: false,
                          context: context,
                          title: Text(
                            'Event Saved Successfully',
                            style: GoogleFonts.montserrat(
                                color: Helper.hexToColor('#149E14'),
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          style: ToastificationStyle.minimal,
                          primaryColor: Helper.hexToColor('#FF8C40'),
                          type: ToastificationType.success,
                        );
                        setState(() {
                          bookmarkProv.addToBookmark(widget.event);
                        });
                      }
                      print(bookmarkProv.isBookmarked(widget.event));
                    },
                    icon: Icon(bookmarkProv.isBookmarked(widget.event) ? Icons.bookmark : Icons.bookmark_border_rounded)
                )
              ],
            ),
            const SizedBox(height: 12,),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Helper.hexToColor('#F4D1B9'),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Text('Dinner',
                style: TextStyle(
                  color: Helper.hexToColor('#242426')
                ),
              ),
            ),
            const SizedBox(height: 12,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'BUSA presents its annual dinner event. This year is themed MET-GALA. Featuring live performing artists, Dance performances and.... ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Helper.hexToColor('#444446'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                    text: 'read more',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Helper.hexToColor('#444446'),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: recognizer
                  )
                ]
              )
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                EventDateTimeDetail(icon: Icons.calendar_today_outlined, title: widget.event.getFormattedDate),
                const SizedBox(width: 24,),
                EventDateTimeDetail(icon: Icons.access_time_rounded, title: widget.event.getFormattedTime(context)),
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Stack(
                    children: [
                     Positioned(
                       child: CircleAvatar(
                         radius: 16,
                         backgroundColor: Colors.transparent,
                         child: Image.asset(widget.event.attendants[0].profileImage,
                           height: double.infinity,
                           width: double.infinity,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                      Positioned(
                        left: 20,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(widget.event.attendants[1].profileImage,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(widget.event.attendants[2].profileImage,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('+${widget.event.attendants.length - 3} others')
              ],
            ),
            const SizedBox(height: 24,),
            Text('Ticket sales end in 4days!!',
              style: TextStyle(
                color: Helper.hexToColor('#FF8C40'),
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 32,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Hypeman Ojobo',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Helper.hexToColor('#242426'),
                  fontSize: 16
                ),
              ),
              subtitle: Text('Organiser',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Helper.hexToColor('#7C7C80'),
                ),
              ),
              leading: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25.7,
                backgroundImage: AssetImage('assets/images/organiser_image_3.png'),
              ),
              horizontalTitleGap: 10,
              trailing: TextButton.icon(
                onPressed: (){},
                icon: Icon(Icons.add,
                  color: Helper.hexToColor('#0D0D0D'),
                ),
                label: Text('Follow',
                  style: TextStyle(
                    color: Helper.hexToColor('#0D0D0D'),
                    fontWeight: FontWeight.w500
                  ),
                )
              ),
            ),
            const SizedBox(height: 52,),
            Text('Select Ticket',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Helper.hexToColor('#545456')
              ),
            ),
            const SizedBox(height: 12,),
            for(final option in options)
              SizedBox(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          onTap:(){
                            if(currentOption == option) return;
                            setState(() {
                              currentOption = option;
                            });
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: TicketSelection(
                            tableType: option['tableType']!,
                            price: double.parse(option['amount']!)
                          ),
                        ),
                        if(currentOption == option)
                          Positioned(
                            right: 5,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white
                              ),
                              child: Icon(
                                Icons.check_circle,
                                color: Helper.hexToColor('#008000')
                              )
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 12,)
                  ],
                )
              ),
            const SizedBox(height: 24,),
            SubmitButton(
              title: 'Checkout NGN ${currentOption != null ? formattedPrice(double.parse(currentOption!['amount']!)) : 0.00}',
              backgroundColor: Helper.hexToColor('#0D0D0D'),
              onPressed: currentOption != null ? (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectionDetailScreen(
                      event: widget.event,
                      selection: currentOption!
                    ),
                  )
                );
              } : null,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

}