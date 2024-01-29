// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class squaretile extends StatelessWidget {
  String image;
  Function()? onTap;
  squaretile({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          image,
          height: 40,
        ),
      ),
    );
  }
}
