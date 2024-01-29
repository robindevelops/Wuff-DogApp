// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:dog_selling/Widgets/custom_textfield.dart';
import 'package:dog_selling/Widgets/dogAdd_button.dart';
import 'package:dog_selling/Widgets/image_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddDogsPage extends StatefulWidget {
  const AddDogsPage({super.key});

  @override
  State<AddDogsPage> createState() => _AddDogsPageState();
}

class _AddDogsPageState extends State<AddDogsPage> {
  ImagePicker imagepicker = ImagePicker();

  final List<File> selectedimages = [];

  Future<void> selectImages() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select images"),
          actions: [
            TextButton(
              onPressed: () {
                getImageSource(ImageSource.camera);
                Navigator.of(context).pop();
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                getImageSource(ImageSource.gallery);
                Navigator.of(context).pop();
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  Future<void> getImageSource(ImageSource source) async {
    if (source == ImageSource.camera) {
      XFile? image = await imagepicker.pickImage(source: source);
      if (image != null) {
        setState(
          () {
            selectedimages.add(File(image.path));
          },
        );
      }
    } else if (source == ImageSource.gallery) {
      List<XFile>? images = await imagepicker.pickMultiImage();
      setState(
        () {
          for (XFile image in images) {
            selectedimages.add(File(image.path));
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Details",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              selectedimages.isNotEmpty
                  ? Imagetile(
                      selectedImages: selectedimages,
                      onImageRemoved: (index) {
                        setState(
                          () {
                            selectedimages.removeAt(index);
                          },
                        );
                      },
                    )
                  : DogAddButton(
                      onTap: () {
                        selectImages();
                      },
                    ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Enter Dog Name',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Gender',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Enter Price',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: TextInputType.number,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Country',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Breed',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Coatdetails',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                text: 'Age',
                icon: const Icon(Icons.person),
                controller: null,
                keyboardType: TextInputType.number,
                suffixIcon: null,
              ),
              const SizedBox(height: 10),
              Custombutton(
                text: 'Add Now',
                color: Colors.lightGreen,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
