import 'package:flutter/material.dart';
import 'package:flutter_user_project/pages/login_page.dart';
import 'package:flutter_user_project/pages/user_information_page.dart';
import 'package:flutter_user_project/models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votre Projet',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/user_information') {
          final User? user = settings.arguments as User?;
          return MaterialPageRoute(
            builder: (context) => UserInformationPage(user!),
          );
        }
        return null;
      },
    );
  }
}
