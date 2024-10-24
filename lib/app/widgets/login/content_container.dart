import 'package:flutter/material.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/widgets/login/login_input.dart';
import 'package:unicornect/app/widgets/login/verifier.dart';
import 'package:unicornect/app/widgets/login/terms_and_conditions.dart';

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
      secondWidget = Verifier(currentUser: _currentUser, pageController: widget.pageController,);
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