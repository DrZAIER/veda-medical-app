
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? suffixText;
  final String? errorText;

  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    this.onChanged,
    this.suffixText,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: label,
          suffixText: suffixText,
          errorText: errorText,
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
    );
  }
}
