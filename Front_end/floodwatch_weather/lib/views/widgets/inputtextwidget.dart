import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'app gradient.dart';
class InputTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool? obscureText; // Nullable boolean for obscure text

  const InputTextField({
    Key? key,
    this.hintText,
    this.textController,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.validator,
    this.obscureText, // Nullable boolean parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: AppGradients.appGradients,
        ),
        child: TextFormField(
          cursorColor: Colors.indigo,
          cursorRadius: const Radius.circular(12.0),
          controller: textController,
          keyboardType: textInputType,
          style: Theme.of(context).textTheme.labelLarge,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,

            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: AppColors.backgroundColor,
            suffixIconColor: AppColors.backgroundColor,
          ),
          validator: validator,
          obscureText: obscureText ?? false, // Set obscureText to false if null
        ),
      ),
    );
  }
}