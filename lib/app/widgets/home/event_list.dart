import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/providers/bookmark_provider.dart';
import 'package:unicornect/app/widgets/home/event_date_time_detail.dart';

class EventList extends ConsumerStatefulWidget{
  const EventList({super.key, required this.events});
  final List<Event> events;

  @override
  ConsumerState<EventList> createState() => _EventListState();
}

class _EventListState extends ConsumerState<EventList> {

  @override
  Widget build(BuildContext context){
    final List<Event> popularEvents = widget.events.where(
        (event) => event.attendants.length > 6
    ).toList();
    final List<Event> upcomingEvents = widget.events.where(
        (event) => !popularEvents.contains(event)
    ).toList();


    print(upcomingEvents);
    final bookmarkProv = ref.watch(bookmarkProvider.notifier);
    // Widget bottom = Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     EventDateTimeDetail(icon: Icons.calendar_today_outlined, title: widget.events[index]['date']),
    //     EventDateTimeDetail(icon: Icons.access_time, title: widget.events[index]['date'])
    //   ],
    // );
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
            height: height * 0.65,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: upcomingEvents.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 420,
                        width: double.infinity,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 258,
                                  width: double.infinity,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Image.asset(
                                    upcomingEvents[index].image,
                                    fit: BoxFit.cover,
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
                                        upcomingEvents[index].title,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          if(bookmarkProv.isBookmarked(upcomingEvents[index])){
                                            setState(() {
                                              bookmarkProv.removeFromBookMark(upcomingEvents[index]);
                                            });
                                          }else{
                                            setState(() {
                                              bookmarkProv.addToBookmark(upcomingEvents[index]);
                                            });
                                          }
                                          print(bookmarkProv.isBookmarked(upcomingEvents[index]));
                                        },
                                        icon: Icon(bookmarkProv.isBookmarked(upcomingEvents[index]) ? Icons.bookmark : Icons.bookmark_border_rounded)
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    EventDateTimeDetail(icon: Icons.calendar_today_outlined, title: upcomingEvents[index].getFormattedDate),
                                    const SizedBox(width: 24,),
                                    EventDateTimeDetail(icon: Icons.access_time, title: upcomingEvents[index].getFormattedTime(context))
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
                                                upcomingEvents[index].attendants[0].profileImage,
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
                                                upcomingEvents[index].attendants[1].profileImage,
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
                                                upcomingEvents[index].attendants[2].profileImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '+${upcomingEvents[index].attendants.length - 3} others',
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
                      );
                    },
                  ),
                  Text(
                    'Most Popular Events',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Helper.hexToColor('#545456')
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: popularEvents.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 460,
                        width: double.infinity,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 258,
                                  width: double.infinity,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Image.asset(
                                    popularEvents[index].image,
                                    fit: BoxFit.cover,
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
                                        popularEvents[index].title,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          if(bookmarkProv.isBookmarked(popularEvents[index])){
                                            setState(() {
                                              bookmarkProv.removeFromBookMark(popularEvents[index]);
                                            });
                                          }else{
                                            setState(() {
                                              bookmarkProv.addToBookmark(popularEvents[index]);
                                            });
                                          }
                                          print(bookmarkProv.isBookmarked(popularEvents[index]));
                                        },
                                        icon: Icon(bookmarkProv.isBookmarked(popularEvents[index]) ? Icons.bookmark : Icons.bookmark_border_rounded)
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    EventDateTimeDetail(icon: Icons.calendar_today_outlined, title: popularEvents[index].getFormattedDate),
                                    const SizedBox(width: 24,),
                                    EventDateTimeDetail(icon: Icons.access_time, title: popularEvents[index].getFormattedTime(context))
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
                                                popularEvents[index].attendants[0].profileImage,
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
                                                popularEvents[index].attendants[1].profileImage,
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
                                                popularEvents[index].attendants[2].profileImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '+${popularEvents[index].attendants.length - 3} others',
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
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}