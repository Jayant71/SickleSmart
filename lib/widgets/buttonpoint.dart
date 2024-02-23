import 'package:flutter/material.dart';

class ButtonPoint extends StatelessWidget {
  const ButtonPoint({super.key, this.bullet, this.onPressed});

  final String? bullet;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(bullet!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20.0,
          )),
    );
  }
}
