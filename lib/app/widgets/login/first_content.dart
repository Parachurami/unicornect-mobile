import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/models/User.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:crypto/crypto.dart';

final key = enc.Key.fromUtf8("32-character key................");
final iv = enc.IV.fromLength(16);

final encrypter = enc.Encrypter(enc.AES(key));


class FirstContent extends StatefulWidget{
  const FirstContent({super.key, required this.pageController, required this.progressHandler});
  final PageController pageController;
  final void Function(User) progressHandler;

  @override
  State<FirstContent> createState() {
    return _FirstContentState();
  }
}

class _FirstContentState extends State<FirstContent>{
  late final User _user;
  final _formKey = GlobalKey<FormState>();

  late String firstName, lastName, username, email;
  late enc.Encrypted password;
  bool _autoValidate = false;
  void _signUp(){
    setState(() {
      _autoValidate = true;
    });
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      widget.pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      widget.progressHandler(
        User(
            firstName: firstName,
            lastName: lastName,
            username: username,
            email: email,
            password: password
        )
      );
    }
  }
  final nameRegExp = RegExp(r"^[a-zA-Z]+(?:[\s'-][a-zA-Z]+)*$");
  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Hello friend! Create an account to get started ",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
        ),
        const SizedBox(height: 14,),
        Text(
          "All Input fields provided below are required to be filled",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 24,),
        Form(
          key: _formKey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InputField(
                        onSaved: (text) {
                          firstName = text!;
                        },
                        placeholder: "e.g John",
                        autoValidate: _autoValidate,
                        label: "First Name",
                        validator: (text){
                          if(text!.isEmpty){
                            return "Required field";
                          }else if(!nameRegExp.hasMatch(text!)){
                            return "Invalid First Name";
                          }
                        },
                        inputType: TextInputType.text,
                        formKey: _formKey
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: InputField(
                        onSaved: (text){
                          lastName = text!;
                        },
                        placeholder: "e.g Doe",
                        autoValidate: _autoValidate,
                        label: "Last Name",
                        validator: (text){
                          if(text!.isEmpty){
                            return "Required field";
                          }else if(!nameRegExp.hasMatch(text!)){
                            return "Invalid Last Name";
                          }
                        },
                        inputType: TextInputType.text,
                        formKey: _formKey
                    ),
                  )
                ],
              ),
              const SizedBox(height: 44,),
              InputField(
                  onSaved: (text){
                    username = text!;
                  },
                  autoValidate: _autoValidate,
                  label: "Username",
                  validator: (text){
                    if(text!.isEmpty){
                      return "Required field";
                    }
                  },
                  inputType: TextInputType.text,
                  formKey: _formKey
              ),
              const SizedBox(height: 44,),
              InputField(
                  onSaved: (text){
                    email = text!;
                  },
                  placeholder: "e.g johndoe@gmail.com",
                  autoValidate: _autoValidate,
                  label: "Email",
                  validator: (text){
                    if(text!.isEmpty){
                      return "Required field";
                    }else if(!emailRegExp.hasMatch(text)){
                      return "Invalid Email Address";
                    }
                  },
                  inputType: TextInputType.emailAddress,
                  formKey: _formKey
              ),
              const SizedBox(height: 44,),
              InputField(
                  onSaved: (text){
                    password = encrypter.encrypt(text!,iv:iv);
                  },
                  autoValidate: _autoValidate,
                  label: "Password",
                  validator: (text){
                    if(text!.isEmpty){
                      return "Required field";
                    }
                  },
                  inputType: TextInputType.visiblePassword,
                  formKey: _formKey
              ),
              const SizedBox(height: 44,),
              SubmitButton(
                  title: "Sign Up",
                  backgroundColor: Colors.black,
                  onPressed: _signUp
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Helper.hexToColor("#FF8C40"),
                        decoration: TextDecoration.underline,
                        decorationColor: Helper.hexToColor("#FF8C40"),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100,)
            ],
          ),
        )
      ],
    );
  }
}