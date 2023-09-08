import 'package:mysql1/mysql1.dart' as mysql;

class DatabaseConnection {
  static mysql.MySqlConnection? _connection;

  static Future<mysql.MySqlConnection> getConnection() async {
    if (_connection != null) return _connection!;

    final settings = mysql.ConnectionSettings(
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: '',
      db: 'flutter_chat_app',
    );

    _connection = await mysql.MySqlConnection.connect(settings);

    return _connection!;
  }
}
