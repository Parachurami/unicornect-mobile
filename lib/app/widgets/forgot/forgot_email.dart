import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key, required this.onNextPress});
  final void Function(String) onNextPress;

  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _submitHandler(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      widget.onNextPress(_emailController.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Forgot password? Don’t worry, we’ll help you reset it',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              'Please enter your registered email address. An OTP will be sent to it',
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Helper.hexToColor('#7C7C80')
              ),
            ),
            const SizedBox(height: 36,),
            InputField(
                inputController: _emailController,
                formKey: _formKey,
                label: 'E-mail Address',
                validator: (text){
                  if(text!.trim().isEmpty){
                    return 'Please enter an email address';
                  }
                  if(!Helper.validEmail(text)){
                    return 'Invalid email address';
                  }
                  return null;
                },
                inputType: TextInputType.emailAddress
            ),
            const SizedBox(height: 44,),
            SubmitButton(
              width: double.infinity,
              title: 'Next',
              backgroundColor: Colors.black,
              onPressed: _submitHandler
            )
          ],
        ),
      ),
    );
  }
}
