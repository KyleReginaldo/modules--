import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthenticatingScreen extends StatelessWidget {
  const AuthenticatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/authentication/authenticating.json',
            height: 120),
      ),
    );
  }
}
