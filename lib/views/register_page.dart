import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_webdev/database/user_database.dart';
import 'package:learn_webdev/model/user_model.dart';
import 'package:learn_webdev/services/auth_service.dart';
import 'package:learn_webdev/views/login_page.dart';
import 'package:learn_webdev/widgets/auth_button.dart';
import 'package:learn_webdev/widgets/auth_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("HTML Dictionary"),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Image.asset(
              'images/logo1.png',
              scale: 3,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 20),
              ),
            ),
            AuthField(controller: usernameController, hintText: "Username"),
            const SizedBox(
              height: 15,
            ),
            AuthField(controller: emailController, hintText: "Email"),
            const SizedBox(
              height: 15,
            ),
            AuthField(controller: passwordController, hintText: "Password"),
            const SizedBox(
              height: 15,
            ),
            AuthButton(
                label: "Register",
                onTap: () async {
                  try {
                    await Authentication.register(UserModel(
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text));

                    UserDatabase.create(
                        FirebaseAuth.instance.currentUser!.uid,
                        UserModel(
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text));

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
