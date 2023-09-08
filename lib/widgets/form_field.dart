import 'package:flutter/material.dart';

class UserInfoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isEditing;

  const UserInfoTextFormField({
    required this.controller,
    required this.labelText,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return isEditing
        ? TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    )
        : Text('$labelText: ${controller.text}');
  }
}
