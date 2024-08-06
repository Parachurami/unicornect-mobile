import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicornect/app/screens/log_in_screen.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<SignInScreen>{
  final _formKey = GlobalKey<FormState>();
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  @override


  void _signIn(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      return;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _focusNode2.addListener(
            (){
          setState(() {

          });
        }
    );
    _focusNode1.addListener(
            (){
          setState(() {

          });
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 247, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome back!\nLet's have a fun experience again",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  Text("All Input fields provided below are required to be filled",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 45,),
                  InputField(
                      formKey: _formKey,
                      // focusNode: _focusNode1,
                      label: "Email or Username",
                      validator: (text){
                        if(text!.trim().isEmpty || text == null){
                          return "Invalid Email or Username";
                        }
                      }, inputType: TextInputType.text),
                  const SizedBox(height: 45,),
                  InputField(
                      formKey: _formKey,
                      // focusNode: _focusNode2,
                      label: "Password",
                      validator: (text){
                        if(text!.trim().isEmpty || text == null){
                          return "Invalid Password";
                        }
                      },
                      inputType: TextInputType.visiblePassword
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){},
                          child: Text("Forgot Password?",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14
                            ),
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SubmitButton(title: "Sign In", backgroundColor: Colors.black, onPressed: _signIn,),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Dont have an account? ",
                          style: GoogleFonts.montserrat(
                            fontSize: 14
                          ),
                      ),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => const LogInScreen()
                              )
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              decorationColor: _hexToColor("#FF8C40"),
                              fontSize: 14,
                              color: _hexToColor("#FF8C40"),
                            ),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}