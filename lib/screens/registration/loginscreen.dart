import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 50,
        width: double.infinity,
        color: Colors.red,
        child: const Center(
          child: Text(
            "Login with Google",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome.jpg"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
