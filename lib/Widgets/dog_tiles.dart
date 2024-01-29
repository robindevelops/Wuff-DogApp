// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class dogtile extends StatelessWidget {
  final String dogname;
  final String gender;
  final String coatdetails;
  final String country;
  final String age;
  final String weight;
  final String image;
  Function()? onTap;
  dogtile(
      {super.key,
      required this.dogname,
      required this.gender,
      required this.coatdetails,
      required this.age,
      required this.country,
      required this.weight,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      behavior: HitTestBehavior.translucent, // Add this line
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 200,
        child: Row(
          children: [
            Expanded(
                child: CircleAvatar(
              maxRadius: 80,
              backgroundImage: AssetImage(image),
            )),
            // Right Section - Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          dogname,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 30,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                gender,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Coat"),
                              Text(
                                coatdetails,
                                style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Originated"),
                              Text(
                                country,
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Age"),
                              Text(
                                age,
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Weight"),
                              Text(
                                weight,
                                style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
