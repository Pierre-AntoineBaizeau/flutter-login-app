import 'package:flutter_user_project/models/user_model.dart';
import 'package:flutter_user_project/data_base/database.dart';

class DatabaseOperations {
  Future<void> createTableIfNotExists() async {
    final conn = await DatabaseConnection.getConnection();
    await conn.query('''
      CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        userName VARCHAR(255),
        userPassword VARCHAR(255)
      )
    ''');
  }

  Future<void> insertUser(User user) async {
    final conn = await DatabaseConnection.getConnection();
    await conn.query(
      'INSERT INTO users (userName, userPassword) VALUES (?, ?)',
      [user.userName, user.userPassword],
    );
  }

  Future<void> updateUser(User user) async {
    final conn = await DatabaseConnection.getConnection();
    await conn.query(
      'UPDATE users SET userName = ?, userPassword = ? WHERE id = ?',
      [user.userName, user.userPassword, user.userID],
    );
  }
}
