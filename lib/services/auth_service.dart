import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_webdev/model/user_model.dart';

class Authentication {
  static login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static register(UserModel userModel) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);

    FirebaseAuth.instance.currentUser!.updateDisplayName(userModel.username);

    FirebaseAuth.instance.currentUser!.updatePhotoURL(userModel.profilePicPath);
  }
}
