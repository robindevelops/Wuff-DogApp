// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class admintile extends StatefulWidget {
  final String image;
  final String text;
  Function()? onTap;
  final Icon icon;
  admintile(
      {super.key,
      required this.icon,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  State<admintile> createState() => _admintileState();
}

class _admintileState extends State<admintile> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 159, 231, 150),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              height: screenwidth * 0.10,
            ),
            const SizedBox(height: 5),
            Text(
              widget.text,
              style: GoogleFonts.abel(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            widget.icon,
          ],
        ),
      ),
    );
  }
}
