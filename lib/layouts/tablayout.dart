import "package:flutter/material.dart";
import 'package:sicklesmart/screens/registration/welcomeauth.dart';

class TabLayout extends StatefulWidget {
  const TabLayout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabLayoutState createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeAuthScreen(),
    );
  }
}
