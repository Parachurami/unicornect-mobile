import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/providers/bookmark_provider.dart';
import 'package:unicornect/app/screens/event_detail.dart';

import 'event_date_time_detail.dart';

class EventCard extends ConsumerWidget{
  const EventCard(this.event, {super.key});
  final Event event;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkProv = ref.watch(bookmarkProvider.notifier);
    return SizedBox(
      height: 420,
      width: double.infinity,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 1,
      //     color: Colors.black
      //   )
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EventDetailScreen(event),
                      )
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 258,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Hero(
                    tag: event.id,
                    child: Image.asset(
                      event.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 18,
                left: 12,
                child: Container(
                  // width: 282,
                  height: 43,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Helper.hexToColor('#D9D9D9').withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Helper.hexToColor('#242426'),
                      ),
                      const SizedBox(width: 8,),
                      Text(
                        'Bells University of Technology',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 12,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 310,
                    child: Text(
                      event.title,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        if(bookmarkProv.isBookmarked(event)){

                          bookmarkProv.removeFromBookMark(event);

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

                          bookmarkProv.addToBookmark(event);
                        }
                        print(bookmarkProv.isBookmarked(event));
                      },
                      icon: Icon(bookmarkProv.isBookmarked(event) ? Icons.bookmark : Icons.bookmark_border_rounded)
                  )
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  EventDateTimeDetail(icon: Icons.calendar_today_outlined, title: event.getFormattedDate),
                  const SizedBox(width: 24,),
                  EventDateTimeDetail(icon: Icons.access_time, title: event.getFormattedTime(context))
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  SizedBox(
                    height: 32,
                    width: 90,
                    child: Stack(
                      children: [
                        // const SizedBox(width: 50,),
                        Positioned(
                          left: 0,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.asset(
                              event.attendants[0].profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 18,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.asset(
                              event.attendants[1].profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 36,
                          child:  Container(
                            clipBehavior: Clip.hardEdge,
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.asset(
                              event.attendants[2].profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '+${event.attendants.length - 3} others',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );;
  }
}