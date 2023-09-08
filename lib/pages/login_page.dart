import 'package:flutter/material.dart';
import 'package:flutter_user_project/models/user_model.dart';
import 'package:flutter_user_project/data_base/database.dart';
import 'package:flutter_user_project/utils/brand_color.dart';
import 'package:flutter_user_project/widgets/connexion_status.dart';
import 'package:flutter_user_project/widgets/form_field.dart';
import 'package:flutter_user_project/widgets/save_button.dart';
import 'package:flutter_user_project/widgets/custom_text_field.dart';
import 'package:flutter_user_project/pages/user_information_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkServerConnection();
  }

  Future<bool> _checkServerConnection() async {
    try {
      await DatabaseConnection.getConnection();
      setState(() {
        _isConnected = true;
      });
      return true;
    } catch (e) {
      setState(() {
        _isConnected = false;
      });
      return false;
    }
  }

  void _login() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final String userName = userNameController.text;
      final String userPassword = userPasswordController.text;
      final User newUser = User.generate(userName, userPassword);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserInformationPage(newUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CheckConnectionStatus(isConnected: _isConnected),
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: BrandColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: BrandColor.chatInputColor,
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/illustration.png'),
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              CustomTextField(
                controller: userNameController,
                labelText: 'Nom d\'utilisateur',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom d\'utilisateur.';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: userPasswordController,
                labelText: 'Mot de passe',
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un mot de passe.';
                  }
                  return null;
                },
              ),
              SaveButton(
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
