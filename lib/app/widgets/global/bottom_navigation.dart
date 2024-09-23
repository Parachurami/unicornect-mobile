import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/providers/scroll_message_provider.dart';
import 'package:unicornect/app/screens/home_screen.dart';
import 'package:unicornect/app/screens/profile_screen.dart';
import 'package:unicornect/app/screens/search_screen.dart';
import 'package:unicornect/app/screens/tickets_screen.dart';
import 'package:unicornect/app/widgets/global/nav_item.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }
  List<Map<String, dynamic>> navItemData = [
    {
      'icon': 'assets/images/home_icon',
      'label':'Home'
    },
    {
      'icon': 'assets/images/search_icon',
      'label':'Search'
    },
    {
      'icon': 'assets/images/ticket_icon',
      'label':'My Tickets'
    },
    {
      'icon': 'assets/images/profile_icon',
      'label':'Profile'
    },
  ];

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketsScreen(),
    const ProfileScreen()
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final scrollMessage = ref.watch(scrollMessageProvider);

    if(scrollMessage){
      _animationController.forward();
     
    }else{
      _animationController.reverse();
    }
    Widget bottomBar = Container(
      height: 81,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...navItemData.map((item){
              int pageIndex = navItemData.indexOf(item);
              return NavItem(
                  icon: '${item['icon']}_${currentPageIndex == pageIndex ? 'fill' : 'outline'}.png',
                  label: item['label'],

                  onTap: (){
                    setState(() {
                      currentPageIndex = pageIndex;
                    });
                  },
                  color: currentPageIndex == pageIndex ? Colors.black : Colors.grey
              );
            })
          ],
        ),
      ),
    );
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0),
              end: const Offset(0, 10)
            ).animate(CurvedAnimation(parent: _animationController, curve: Curves.ease)),
            child: child,
          );
        },
        child: bottomBar,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      // backgroundColor: Colors.red,
      body: pages[currentPageIndex],
    );
  }
}
