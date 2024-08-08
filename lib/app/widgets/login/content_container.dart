import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/widgets/login/first_content.dart';
import 'package:unicornect/app/widgets/login/second_content.dart';
import 'package:unicornect/app/widgets/login/third_content.dart';

class ContentContainer extends StatefulWidget{
  const ContentContainer({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<ContentContainer> createState() {
    return _ContentContainerState();
  }
}

class _ContentContainerState extends State<ContentContainer>{
  // final PageController _pageController = PageController();
  late User _currentUser;
  Widget secondWidget = const Center();
  void createUser(User user){
    setState(() {
      _currentUser = user;
      secondWidget = SecondContent(currentUser: _currentUser, pageController: widget.pageController,);
    });
  }

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: widget.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        FirstContent(
          progressHandler: createUser,
          pageController: widget.pageController,
        ),
        secondWidget,
        const ThirdContent()
      ],
    );
  }

}