class User {
  int userID;
  String userName;
  String userPassword;

  User({required this.userID, required this.userName, required this.userPassword});

  static int _nextUserID = 1;

  factory User.generate(String userName, String userPassword) {
    final newUser = User(
      userID: _nextUserID,
      userName: userName,
      userPassword: userPassword,
    );
    _nextUserID++;
    return newUser;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userID,
      'userName': userName,
      'userPassword': userPassword,
    };
  }
}
