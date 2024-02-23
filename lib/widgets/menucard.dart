import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.alignment});

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 230,
        height: 110,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
      ),
    );
  }
}
