import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({Key? key, required this.controller, required this.hintText})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          hintText: hintText),
    );
  }
}
