import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/widgets/forgot/forgot_content_container.dart';

class ForgotScreen extends StatefulWidget{
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() {
    return _ForgotScreenState();
  }
}
class _ForgotScreenState extends State<ForgotScreen>{
  final _pageController = PageController();
  int pageIndex = 0;
  void _backPressHandler(){
    if(pageIndex > 0){
      _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener((){
      setState(() {
        pageIndex = _pageController.page?.round() ?? 0;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          // physics: pageIndex > 1 ? const NeverScrollableScrollPhysics() : null,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed:_backPressHandler,
                      icon: const Icon(Icons.arrow_back_rounded)
                  ),
                  const SizedBox(width: 20,),
                  Text(
                    pageIndex < 1 ? 'Forgot Password' : 'Back',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90,),
              SizedBox(
                height: deviceHeight - 180,
                child: ForgotContentContainer(
                  pageController: _pageController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}