import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class Verifier extends StatefulWidget{
  const Verifier({super.key, this.currentUser, required this.pageController, this.onVerify, this.userEmail});
  final User? currentUser;
  final PageController pageController;
  final String? userEmail;
  final void Function(String)? onVerify;

  @override
  State<Verifier> createState() {
    return _VerifierState();
  }
}

class _VerifierState extends State<Verifier>{
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  static const _maxSeconds = 90;
  int _remainingSeconds = _maxSeconds;
  Timer? _timer;
  late final TextEditingController _textController1;
  late final TextEditingController _textController2;
  late final TextEditingController _textController3;
  late final TextEditingController _textController4;
  String _enteredCode = "";

  void _handleInput(){
    setState(() {
      _enteredCode = '${_textController1.text}${_textController2.text}${_textController3.text}${_textController4.text}';
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();

    _textController1.addListener(_handleInput);
    _textController2.addListener(_handleInput);
    _textController3.addListener(_handleInput);
    _textController4.addListener(_handleInput);
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer){
          if(_remainingSeconds > 0){
            setState(() {
              _remainingSeconds--;
            });
          }
          // else{
          //   _timer?.cancel();
          // }
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController1.removeListener(_handleInput);
    _textController2.removeListener(_handleInput);
    _textController3.removeListener(_handleInput);
    _textController4.removeListener(_handleInput);
    _focusNode5.dispose();
    _focusNode3.dispose();
    _focusNode2.dispose();
    _focusNode1.dispose();
    super.dispose();
  }

  String formatSeconds(int seconds){
    String minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    String secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes : ${secs}s';
  }

  void _resendOTP(){
    setState(() {
      _remainingSeconds = _maxSeconds;
    });
  }

  void _showSuccessMessage() async{
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 117,
                  width: 117,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Helper.hexToColor('#149E14')
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 75,
                      weight: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  widget.currentUser!.email!,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 12,),
                Text(
                  'Verified',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    await Future.delayed(
      const Duration(milliseconds: 1500),
      (){
        Navigator.pop(context);
      }
    );
    widget.pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _focusNode5.unfocus();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.onVerify != null ? "OTP Verification" : "Email Verification",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 14,),
        Text(
          "We’ve just sent a 4-digit code to ${widget.userEmail ?? widget.currentUser?.email}, please enter it below",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 80,),
        Row(
          children: [
            Expanded(
                child: InputField(
                  inputController: _textController1,
                  onChange: (text){
                    if(text!.isNotEmpty){
                      _focusNode2.requestFocus();
                    }
                  },
                  inputFocusNode: _focusNode1,
                  maxLength: 1,
                  label: '',
                  validator: (String? text) {  },
                  inputType: TextInputType.number,
                )
            ),
            const SizedBox(width: 28,),
            Expanded(
                child: InputField(
                  inputController: _textController2,
                  onChange: (text){
                    if(text!.isNotEmpty){
                      _focusNode3.requestFocus();
                    }else if(text!.isEmpty){
                      _focusNode1.requestFocus();
                    }
                  },
                  inputFocusNode: _focusNode2,
                  maxLength: 1,
                  label: '',
                  validator: (String? text) {  },
                  inputType: TextInputType.number,
                )
            ),
            const SizedBox(width: 28,),
            Expanded(
                child: InputField(
                  inputController: _textController3,
                  onChange: (text){
                    if(text!.isNotEmpty){
                      _focusNode5.requestFocus();
                    }else if(text!.isEmpty){
                      _focusNode2.requestFocus();
                    }
                  },
                  inputFocusNode: _focusNode3,
                  maxLength: 1,
                  label: '',
                  validator: (String? text) {  },
                  inputType: TextInputType.number,
                )
            ),
            const SizedBox(width: 28,),
            Expanded(
                child: InputField(
                  inputController: _textController4,
                  onChange: (text){
                    if(text!.isEmpty){
                      _focusNode3.requestFocus();
                    }
                  },
                  inputFocusNode: _focusNode5,
                  maxLength: 1,
                  label: '',
                  validator: (String? text) {  },
                  inputType: TextInputType.number,
                )
            ),
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              formatSeconds(_remainingSeconds),
              style: GoogleFonts.montserrat(
                  color: Colors.black
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(height: 64,),
        SubmitButton(
            title: 'Verify Email',
            backgroundColor: Colors.black,
            // onPressed:_enteredCode.length == 4 ? _showSuccessMessage: null
            onPressed:_enteredCode.length == 4 ? (){
              if(widget.onVerify != null){
                widget.onVerify!(widget.userEmail!);
              }else{
                _showSuccessMessage();
              }
            }:null
              // _enteredCode.length == 4 ? widget.onVerify != null ? widget.onVerify!(widget.userEmail!) :
              //   _showSuccessMessage
              // : (){
              //   widget.onVerify!(widget.userEmail!)
              // }

        ),
        const SizedBox(height: 24,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn’t receive an OTP?",
              style: GoogleFonts.montserrat(
                  fontSize: 14
              ),
            ),
            const SizedBox(width: 2,),
            GestureDetector(
                onTap:_resendOTP,
                child: Text(
                  'Resend code',
                  style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: Helper.hexToColor("#FF8C40"),
                    fontSize: 14,
                    color: Helper.hexToColor("#FF8C40"),
                  ),
                )
            )
          ],
        )
      ],
    );
  }
}