import 'dart:developer';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log("SOME START UP LOGIC HERE");
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pushReplacementNamed("/"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("LOADING..."),
      ),
    );
  }
}
