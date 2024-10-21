import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/providers/new_user_provider.dart';
import 'package:unicornect/app/widgets/first_start_content.dart';
import 'package:unicornect/app/widgets/second_start_content.dart';

class FirstPage extends ConsumerStatefulWidget{
  const FirstPage({super.key});

  @override
  ConsumerState<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;


  late Timer _timer;
  bool isFirst = true;
  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1,
      lowerBound: 0
    );
    _timer = Timer.periodic(
      const Duration(seconds: 5),
          (timer) {
        setState(() {
          isFirst = !isFirst;
          // _animationController.forward();
          if(isFirst){
            _animationController.forward();
          }else{
            _animationController.animateBack(0);
          }
        });
      },
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    _animationController.dispose();
    // _animation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 391,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            // width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            ),
            child: Stack(
                fit: StackFit.expand,
                children: [
                  isFirst ?
                  Image.asset("assets/images/image4.png", fit: BoxFit.cover,)
                  :
                  Image.asset("assets/images/image6.png", fit: BoxFit.cover,),
                  Positioned(
                    top: 36,
                    right: 16,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.6),
                            foregroundColor: Colors.white
                        ),
                        onPressed: (){
                          ref.read(newUserProvider.notifier).addNewUser();
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.montserrat(

                          ),
                        )
                    ),
                  )
                ]
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MatrixTransition(
                animation: _animation,
                onTransform: (double animationValue) {  
                  return Matrix4.translationValues((animationValue * 20), 0, 0);
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Helper.hexToColor("#FF8C40")
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              MatrixTransition(
                animation: _animation,
                onTransform: (double animationValue) {
                  return Matrix4.translationValues(-(animationValue * 20), 0, 0);
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black12
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          isFirst ? FirstStartContent(
            onNextPressed: (){
              _animationController.forward();
              setState(() {
                isFirst = false;
              });
            },
          ) : SecondStartContent(
            onPreviousPressed: (){
              _animationController.animateBack(0);
              setState(() {
                isFirst = true;
              });
            },
            onNextPressed: (){
              ref.read(newUserProvider.notifier).addNewUser();
            },
          )
        ],
      ),
    );
  }
}