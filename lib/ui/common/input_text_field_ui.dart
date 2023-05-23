import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    this.hintText,
    this.obscureText,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  final String? hintText;
  final bool? obscureText;
  final void Function(String value)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    logDebug("Rebuild InputTextField");

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          errorText: errorText),
    );
  }
}
