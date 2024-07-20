import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Widget prefixIcon;
  final String labelText;
  final TextStyle labelStyle;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.prefixIcon,
    required this.labelText,
    required this.labelStyle,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
