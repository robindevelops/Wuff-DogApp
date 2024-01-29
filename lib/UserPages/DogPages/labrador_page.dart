// ignore_for_file: prefer_const_constructors

import 'package:dog_selling/UserPages/DogPages/dog_details.dart';
import 'package:dog_selling/Widgets/dog_tiles.dart';
import 'package:dog_selling/database.dart';
import 'package:flutter/material.dart';

class LabradorPage extends StatefulWidget {
  const LabradorPage({super.key});

  @override
  State<LabradorPage> createState() => _LabradorPageState();
}

class _LabradorPageState extends State<LabradorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: labrador.length,
        itemBuilder: (context, index) {
          return dogtile(
            dogname: labrador[index].dogname.toString(),
            gender: labrador[index].gender.toString(),
            coatdetails: labrador[index].coatdetails.toString(),
            age: labrador[index].age.toString(),
            country: labrador[index].country.toString(),
            weight: labrador[index].weight.toString(),
            image: labrador[index].image.toString(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DogDetailsPage(
                      dog: labrador[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
