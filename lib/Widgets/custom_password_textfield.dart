// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomPasswordTextfield extends StatefulWidget {
  String? text;
  Icon? icon;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomPasswordTextfield({
    Key? key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool ispasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: ispasswordvisible ? false : true,
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  ispasswordvisible = !ispasswordvisible;
                });
              },
              icon: ispasswordvisible
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off)),
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
