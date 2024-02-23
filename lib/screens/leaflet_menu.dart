import 'package:flutter/material.dart';

class Leaflet extends StatelessWidget {
  const Leaflet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ));
  }
}
