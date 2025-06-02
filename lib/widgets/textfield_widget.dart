import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final FocusNode focus;
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.focus,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focus,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
