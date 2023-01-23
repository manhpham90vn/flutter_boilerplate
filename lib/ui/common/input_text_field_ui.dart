import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    this.hintText,
    this.obscureText,
    this.controller,
    this.errorText,
  }) : super(key: key);

  final String? hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? errorText;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          errorText: widget.errorText),
    );
  }
}
