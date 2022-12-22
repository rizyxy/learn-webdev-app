class UserModel {
  String profilePicPath;
  String username;
  String email;
  String password;

  UserModel(
      {required this.username,
      required this.email,
      required this.password,
      this.profilePicPath =
          "https://firebasestorage.googleapis.com/v0/b/learn-html-cbc61.appspot.com/o/blank-profile-picture-973460__480.webp?alt=media&token=78fb6fd8-ca34-4fa3-bbb3-8775571266de"});

  Map<String, dynamic> toJson() {
    return ({
      "profilePicture": profilePicPath,
      "username": username,
      "email": email,
      "password": password
    });
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
}
