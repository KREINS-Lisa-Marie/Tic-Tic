import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/sizes.dart';

class MyTextInput extends StatefulWidget {
   MyTextInput({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.validator,
    this.hintText,
    //this.formKey,
    this.obscureText = false,
    this.keyboardType,
  });

  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  //final Key? formKey;
   bool obscureText;

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      //key: formKey,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: (){
              setState((){
                widget.obscureText =! widget.obscureText;
              });
            },
            icon: widget.obscureText? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        ),
        prefixIcon: widget.prefixIcon,
        label: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPaddingS,
            vertical: kVerticalPaddingXS,
          ),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
          ),
          child: Text(widget.labelText, style: kLabelStyle),
        ),
        // exam erklären das
        hintText: widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        /// immer oben
        fillColor: kBackgroundColor,
      ),
    );
  }
}
