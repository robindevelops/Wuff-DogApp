// ignore_for_file: prefer_const_constructors

import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:dog_selling/database.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DogDetailsPage extends StatelessWidget {
  final Dogs dog;
  const DogDetailsPage({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    final TextStyle commonTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Image.asset(
                    dog.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rs 30,000",
                    // style: GoogleFonts.acme(
                    //     fontSize: 25, fontWeight: FontWeight.bold),
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "German Shepherd For Sale",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Age", style: commonTextStyle),
                      Spacer(),
                      Text("2", style: commonTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sex", style: commonTextStyle),
                      Spacer(),
                      Text("Female", style: commonTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Coat", style: commonTextStyle),
                      Spacer(),
                      Text("Long", style: commonTextStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Vaccinated", style: commonTextStyle),
                      Spacer(),
                      Text("Yes", style: commonTextStyle),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Discription",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ExpandableText(
                    "This is Very cute Dog and It is Vaccinated, This is Very cute Dog and It is Vaccinated, This is Very cute Dog and It is Vaccinated",
                    expandText: 'See More',
                    collapseText: 'See Less',
                    linkColor: Colors.blue,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.black),
                  SizedBox(height: 30),
                  Center(
                    child: Custombutton(
                      text: "Buy Now",
                      color: Colors.lightGreen,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Custombutton(
                      text: "Add Cart",
                      color: const Color.fromARGB(255, 234, 178, 196),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
