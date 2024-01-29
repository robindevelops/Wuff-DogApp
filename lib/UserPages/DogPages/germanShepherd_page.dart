import 'package:dog_selling/UserPages/DogPages/dog_details.dart';
import 'package:dog_selling/Widgets/dog_tiles.dart';
import 'package:dog_selling/database.dart';
import 'package:flutter/material.dart';

class GermanShepherd extends StatelessWidget {
  const GermanShepherd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: germanshepherd.length,
        itemBuilder: (context, index) {
          return dogtile(
            dogname: germanshepherd[index].dogname.toString(),
            gender: germanshepherd[index].gender.toString(),
            coatdetails: germanshepherd[index].coatdetails.toString(),
            age: germanshepherd[index].age.toString(),
            country: germanshepherd[index].country.toString(),
            weight: germanshepherd[index].weight.toString(),
            image: germanshepherd[index].image.toString(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DogDetailsPage(dog: germanshepherd[index]);
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
