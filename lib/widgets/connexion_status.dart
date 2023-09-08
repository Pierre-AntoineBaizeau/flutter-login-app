import 'package:flutter/material.dart';

class CheckConnectionStatus extends StatelessWidget {
  final bool isConnected;

  const CheckConnectionStatus({
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isConnected ? Icons.check_circle : Icons.error,
          color: isConnected ? Colors.green : Colors.red,
          size: 50,
        ),
        SizedBox(width: 16),
        Text(
          isConnected ? 'Connecté au serveur' : 'Non connecté au serveur',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
