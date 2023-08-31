import 'package:flutter/material.dart';

import 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 40),
        Image.asset("assets/images/logothotsakan.png",
            height: 250, fit: BoxFit.fitWidth),
        Expanded(
          child: SingleChildScrollView(
            child: LoginForm(
              defaultUsername: "",
              defaultPassword: "",
            ),
          ),
        ),
      ],
    ));
  }
}
