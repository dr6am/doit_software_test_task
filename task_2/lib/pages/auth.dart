import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("LOGIN"),
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/main"),
          ),
        ),
      );
}
