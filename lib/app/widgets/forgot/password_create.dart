import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class PasswordCreate extends StatefulWidget {
  const PasswordCreate({super.key, this.onSubmit});
  final void Function()? onSubmit;

  @override
  State<PasswordCreate> createState() => _PasswordCreateState();
}

class _PasswordCreateState extends State<PasswordCreate> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void saveHandler(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      widget.onSubmit!();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width:double.infinity,
                  child: Text(
                    'Create New Password',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Set a new password you’ll be able to remember whenever you want to login',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(height: 36,),
                InputField(
                    formKey: _formKey,
                    inputController: _passwordController,
                    label: 'New Password',
                    validator: (text){
                      if(text!.isEmpty){
                        return 'This field in required';
                      }
                    },
                    inputType: TextInputType.visiblePassword
                ),
                const SizedBox(height: 40,),
                InputField(
                    formKey: _formKey,
                    inputController: _confirmPasswordController,
                    label: 'Confirm New Password',
                    validator: (text){
                      if(text!.isEmpty){
                        return 'This field in required';
                      }
                      if(text! != _passwordController.text){
                        return "Both password don't match";
                      }
                    },
                    inputType: TextInputType.visiblePassword
                ),
                const SizedBox(height: 44,),
                SubmitButton(
                    width: double.infinity,
                    title: 'Save Password',
                    backgroundColor: Colors.black,
                    onPressed: saveHandler
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
