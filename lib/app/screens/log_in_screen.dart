import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/widgets/login/content_container.dart';
import 'package:unicornect/app/widgets/progress_bar.dart';

class LogInScreen extends StatefulWidget{
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LogInScreen>{
  final PageController _pageController = PageController();
  int progressIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener((){
      setState(() {
        progressIndex = _pageController.page?.round() ?? 0;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: progressIndex > 0 ? const NeverScrollableScrollPhysics() : null,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if(_pageController.page! > 0){
                          _pageController.previousPage(duration: const Duration( milliseconds: 500), curve: Curves.easeInOut);
                          return;
                      }
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 1,),
                  Text(
                    "Back",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              ProgressBar( index: progressIndex,),
              const SizedBox(height: 24,),
              SizedBox(
                  height: heigth + 60,
                  child: ContentContainer(
                    pageController: _pageController,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}