import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/screens/sign_in_screen.dart';
import 'package:unicornect/app/widgets/forgot/forgot_email.dart';
import 'package:unicornect/app/widgets/forgot/password_create.dart';
import 'package:unicornect/app/widgets/login/verifier.dart';

class ForgotContentContainer extends StatefulWidget {
  const ForgotContentContainer({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<ForgotContentContainer> createState() => _ForgotContentContainerState();
}

class _ForgotContentContainerState extends State<ForgotContentContainer> {

  Widget secondWidget = Container();
  void _verifyEmail(String email){
    widget.pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut
    );
  }

  void _nextHandler(String email){
    widget.pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut
    );
    submitEmail(email);
  }
  void submitEmail(String email){
    secondWidget = Verifier(
      pageController: widget.pageController,
      userEmail: email,
      onVerify: _verifyEmail,
    );
  }

  void _passwordChange(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (ctx) => const SignInScreen()
        )
    );
    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      animationDuration: const Duration(milliseconds: 500),
      showProgressBar: false,
      context: context,
      title: Text(
        'Password Saved Successfully',
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
  }
  @override
  Widget build(BuildContext context) {

    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: [
        ForgotEmail(
          onNextPress: _nextHandler,
        ),
        secondWidget,
        PasswordCreate(
          onSubmit: _passwordChange,
        ),
      ],
    );
  }
}
