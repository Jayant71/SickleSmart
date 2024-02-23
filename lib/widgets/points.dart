import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  const Points({super.key, this.bullet, this.text});

  final String? bullet;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final padTop = bullet == "\u25A0" ? 0.0 : 3.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 10,
            top: padTop,
          ),
          child: Text(
            bullet!,
          ),
        ),
        Expanded(
          child: Text(
            text!,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
