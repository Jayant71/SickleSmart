import "package:flutter/material.dart";
import 'package:sicklesmart/screens/registration/welcomeauth.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeAuthScreen(),
    );
  }
}
