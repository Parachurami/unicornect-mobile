import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget{
  const InputField({super.key, required this.label, required this.validator, required this.inputType, this.formKey, this.autoValidate, this.placeholder, this.inputController, this.onSaved, this.maxLength, this.inputFocusNode, this.onChange});
  final String label;
  final String? Function(String? text) validator;
  final String? Function(String? text)? onSaved;
  final void Function(String?)? onChange;
  final TextInputType inputType;
  final bool? autoValidate;
  final GlobalKey<FormState>? formKey;
  final String? placeholder;
  final TextEditingController? inputController;
  final int? maxLength;
  final FocusNode? inputFocusNode;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode focusNode = FocusNode();
  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  bool _obscureText = false;


  @override
  void initState() {
    // TODO: implement initState
    focusNode.addListener((){
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.inputController,
      onChanged: (text){
        if(widget.autoValidate ?? false){
          widget.formKey!.currentState!.validate();
        }
        if(widget.onChange != null) {
          widget.onChange!(text);
        }
      },
      onSaved: widget.onSaved,
      keyboardType: widget.inputType,
      obscureText: _obscureText,
      obscuringCharacter: "*",
      cursorColor: _hexToColor("#7C7C80"),
      cursorWidth: 1,
      style: GoogleFonts.montserrat(
          color: _hexToColor("#7C7C80"),
          fontSize: _obscureText ? 17 : 16,
          letterSpacing: _obscureText ? 3 : 1,
      ),
      buildCounter: (context, {required currentLength, required isFocused, required maxLength}) {
        return null;
      },
      textAlign: widget.maxLength == 1 ? TextAlign.center : TextAlign.left,
      focusNode: widget.inputFocusNode ?? focusNode,
      decoration: InputDecoration(
          hintText: widget.placeholder,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: widget.inputType == TextInputType.visiblePassword ? IconButton(
            onPressed: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Image.asset(_obscureText ? "assets/images/eyeOff.png": "assets/images/eye.png",width: 24,height: 24,),
          ) : null,
          focusColor:_hexToColor("#FF8C40") ,
          label: Text(widget.label,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: _hexToColor("#242426"),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: _hexToColor("#FF8C40"),
                  width: 1.5
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: _hexToColor("#FF6347"),
                  width: 1.5
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: _hexToColor("#7C7C80"),
                  width: 1.5
              )
          )
      ),
      validator: widget.validator,
    );
  }
}