import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/widgets/input_field.dart';

class SecondContent extends StatefulWidget{
  const SecondContent({super.key, required this.currentUser});
  final User currentUser;

  @override
  State<SecondContent> createState() {
    return _SecondContentState();
  }
}

class _SecondContentState extends State<SecondContent>{
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode5.dispose();
    _focusNode3.dispose();
    _focusNode2.dispose();
    _focusNode1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Email Verification",
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
          "We’ve just sent a 6-digit code to ${widget.currentUser.email}, please enter it below",
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
                  onChange: (text){
                    if(text?.length == 1){
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
                  onChange: (text){
                    if(text?.length == 1){
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
                  onChange: (text){
                    if(text?.length == 1){
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
              "00:59s",
              style: GoogleFonts.montserrat(
                  color: Colors.black
              ),
              textAlign: TextAlign.right,
            ),
          ],
        )
      ],
    );
  }
}