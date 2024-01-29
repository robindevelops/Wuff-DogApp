import 'package:dog_selling/UserPages/DogPages/dog_details.dart';
import 'package:dog_selling/Widgets/dog_tiles.dart';
import 'package:dog_selling/database.dart';
import 'package:flutter/material.dart';

class SamoyedPage extends StatelessWidget {
  const SamoyedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: samoyed.length,
        itemBuilder: (context, index) {
          return dogtile(
            dogname: samoyed[index].dogname.toString(),
            gender: samoyed[index].gender.toString(),
            coatdetails: samoyed[index].coatdetails.toString(),
            age: samoyed[index].age.toString(),
            country: samoyed[index].country.toString(),
            weight: samoyed[index].weight.toString(),
            image: samoyed[index].image.toString(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DogDetailsPage(
                      dog: samoyed[index],
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
