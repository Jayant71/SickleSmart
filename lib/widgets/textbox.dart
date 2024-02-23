import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      this.labelText,
      this.prefixIcon,
      this.keyboardType,
      required this.controller});

  final String? labelText;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: keyboardType,
      onTapOutside: (ctx) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
