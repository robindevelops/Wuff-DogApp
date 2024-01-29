// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  String text;
  Color color;
  void Function()? onPressed;
  Custombutton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
