import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/event.dart';
import 'package:unicornect/app/providers/bookmark_provider.dart';
import 'package:unicornect/app/providers/scroll_message_provider.dart';
import 'package:unicornect/app/screens/event_detail.dart';
import 'package:unicornect/app/widgets/home/event_card.dart';
import 'package:unicornect/app/widgets/home/event_date_time_detail.dart';

class EventList extends ConsumerStatefulWidget{
  const EventList({super.key, required this.events});
  final List<Event> events;

  @override
  ConsumerState<EventList> createState() => _EventListState();
}

class _EventListState extends ConsumerState<EventList> {
  late ScrollController _scrollController;

  void onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      ref.read(scrollMessageProvider.notifier).updateMessenger(true);
      return;
    }
    ref.read(scrollMessageProvider.notifier).updateMessenger(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    _scrollController.addListener(onScroll);
    super.initState();
  }
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
            height: height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Upcoming Events Near You',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Helper.hexToColor('#545456')
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(bottom: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: upcomingEvents.length,
                    itemBuilder: (context, index) {
                      return EventCard(upcomingEvents[index]);
                    },
                  ),
                  const SizedBox(height: 10,),
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
                      return EventCard(upcomingEvents[index]);
                    },
                  ),
                ],
              ),
            ),
          );
  }
}