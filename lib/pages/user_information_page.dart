import 'package:flutter/material.dart';
import 'package:flutter_user_project/models/user_model.dart';
import 'package:flutter_user_project/repository/db.dart';
import 'package:flutter_user_project/widgets/form_field.dart';
import 'package:flutter_user_project/widgets/save_button.dart';

class UserInformationPage extends StatefulWidget {
  final User user;

  UserInformationPage(this.user);

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  late TextEditingController _userNameController;
  late TextEditingController _userPasswordController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(text: widget.user.userName);
    _userPasswordController = TextEditingController(text: widget.user.userPassword);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userPasswordController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }
  DatabaseOperations databaseOperations = DatabaseOperations();

  void _saveUser() async {
    _toggleEditing();
    final updatedUser = User(
      userID: widget.user.userID,
      userName: _userNameController.text,
      userPassword: _userPasswordController.text,
    );
    await databaseOperations.updateUser(updatedUser);
    _toggleEditing();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations Utilisateur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UserID: ${widget.user.userID}'),
            UserInfoTextFormField(
              controller: _userNameController,
              labelText: 'Nom d\'utilisateur',
              isEditing: _isEditing,
            ),
            UserInfoTextFormField(
              controller: _userPasswordController,
              labelText: 'Mot de passe',
              isEditing: _isEditing,
            ),
            SizedBox(height: 16),
            SaveButton(
              onPressed: _saveUser,
            ),
            ElevatedButton(
              onPressed: _toggleEditing,
              child: Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}
