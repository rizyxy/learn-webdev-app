import 'package:flutter/material.dart';
import 'package:learn_webdev/services/auth_service.dart';
import 'package:learn_webdev/views/home_page.dart';
import 'package:learn_webdev/views/register_page.dart';
import 'package:learn_webdev/widgets/auth_button.dart';
import 'package:learn_webdev/widgets/auth_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

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
        child: Center(
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
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              AuthField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              AuthField(
                controller: passwordController,
                hintText: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              const InkWell(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthButton(
                label: "Login",
                onTap: () async {
                  try {
                    await Authentication.login(
                        emailController.text, passwordController.text);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Does not have account ?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage())),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
