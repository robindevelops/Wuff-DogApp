// ignore_for_file: prefer_const_constructors

import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool slider = false;
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(
                        0.3,
                      ),
                      BlendMode.dstIn,
                    ),
                    child: Image.asset(
                      "lib/images/background.jpg",
                      fit: BoxFit.cover,
                      height: screenheight,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: screenwidth * 0.2,
                        child: Image.asset("lib/images/paw.png"),
                      ),
                      Text(
                        "W u f f !",
                        style: GoogleFonts.rubikBurned(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: screenwidth * 0.09,
                        ),
                      ),
                      SizedBox(height: screenheight * 0.1),
                      Image.asset(
                        "lib/images/dogs.png",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Discover Best Friends",
                        style: GoogleFonts.aBeeZee(
                          fontSize: screenwidth * 0.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Planning to add a new Memeber in you\n    Family! lets Search for your friend\n                      and name it",
                        style: GoogleFonts.aBeeZee(
                          fontSize: screenwidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 50),
                      Custombutton(
                        text: 'S T A R T',
                        color: Colors.green,
                        onPressed: () {
                          Navigator.pushNamed(context, './signup');
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
