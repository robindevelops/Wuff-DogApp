// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  String? text;
  Icon? icon;
  TextEditingController? controller;
  TextInputType? keyboardType;
  IconButton? suffixIcon;

  CustomTextfield({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.keyboardType,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          prefixIconColor: Colors
              .grey, // Use prefixIconColor to set the color of the prefix icon
          suffixIcon: widget.suffixIcon,
          hintText: widget.text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
