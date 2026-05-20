import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(controller: email),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home', arguments: email.text);
            },
            child: Text("Entrar"),
          )
        ],
      ),
    );
  }
}
