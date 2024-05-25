import 'package:flutter/material.dart';

class PButton extends StatelessWidget {
  const PButton({super.key, required this.text, required this.onPressed});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class OButton extends StatelessWidget {
  const OButton({super.key, required this.text, required this.onPressed});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
