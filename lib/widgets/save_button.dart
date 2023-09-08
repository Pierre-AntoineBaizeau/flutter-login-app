import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;

  const SaveButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Enregistrer'),
    );
  }
}
