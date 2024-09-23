import 'package:flutter/material.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/widgets/input_field.dart';
import 'package:unicornect/app/widgets/submit_button.dart';

class Personal extends StatefulWidget{
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  final _formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    firstController.dispose();
    lastController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _handleSave(){
    setState(() {
      autoValidate = true;
    });
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 22, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: InputField(
                    placeholder: 'e.g John',
                    inputController: firstController,
                    autoValidate: autoValidate,
                    formKey: _formKey,
                    label: 'First Name',
                    validator: (text) {
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter a first name';
                      }
                      if(!Helper.validName(text)){
                        return 'Enter valid first name';
                      }
                      return null;
                    },
                    inputType: TextInputType.text
                  )
                ),
                const SizedBox(width: 16,),
                Expanded(
                    child: InputField(
                        placeholder: 'e.g Doe',
                      inputController: lastController,
                      autoValidate: autoValidate,
                      formKey: _formKey,
                      label: 'Last Name',
                      validator: (text) {
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter a last name';
                        }
                        if(!Helper.validName(text)){
                          return 'Enter valid last name';
                        }
                        return null;
                      },
                      inputType: TextInputType.text
                    )
                )
              ],
            ),
            const SizedBox(height: 30,),
            InputField(
              inputController: usernameController,
              autoValidate: autoValidate,
              formKey: _formKey,
              label: 'Username',
              validator: (text) {
                if(text == null || text.trim().isEmpty){
                  return 'Please enter valid username';
                }
                return null;
              },
              inputType: TextInputType.text
            ),
            const SizedBox(height: 30,),
            InputField(
              placeholder: 'e.g johndoe@gmail.com',
              inputController: emailController,
              autoValidate: autoValidate,
              formKey: _formKey,
              label: 'E-mail',
              validator: (text) {
                if(text == null || text.trim().isEmpty){
                  return 'Please enter an email';
                }
                if(!Helper.validEmail(text)){
                  return 'Enter valid email';
                }
                return null;
              },
              inputType: TextInputType.emailAddress
            ),
            const SizedBox(height: 30,),
            InputField(
              inputController: passwordController,
              autoValidate: autoValidate,
              formKey: _formKey,
              label: 'Password',
              validator: (text) {
                if(text == null || text.trim().isEmpty){
                  return 'Please enter a password';
                }
                if(text.trim().length < 6){
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              inputType: TextInputType.visiblePassword
            ),
            const SizedBox(height: 30,),
            InputField(
              inputController: confirmController,
              autoValidate: autoValidate,
              formKey: _formKey,
              label: 'Confirm Password',
              validator: (text) {
                if(text == null || text.trim().isEmpty){
                  return 'Please enter a password';
                }
                if(passwordController.text != text){
                  return "Password don't match";
                }
                if(text.trim().length < 6){
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              inputType: TextInputType.visiblePassword
            ),
            const SizedBox(height: 36,),
            SubmitButton(
              title: 'Save changes',
              backgroundColor: Colors.black,
              onPressed: _handleSave,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}