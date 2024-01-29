// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DogAddButton extends StatefulWidget {
  void Function()? onTap;
  DogAddButton({super.key, required this.onTap});

  @override
  State<DogAddButton> createState() => _DogAddButtonState();
}

class _DogAddButtonState extends State<DogAddButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.lightBlue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo_outlined),
            SizedBox(width: 3),
            Text("Add Images"),
          ],
        ),
      ),
    );
  }
}
