import 'package:flutter/material.dart';
import 'dart:io';

class Imagetile extends StatefulWidget {
  const Imagetile({
    Key? key,
    required List<File> selectedImages,
    required Function(int) onImageRemoved,
  })  : _selectedImages = selectedImages,
        _onImageRemoved = onImageRemoved,
        super(key: key);

  final List<File> _selectedImages;
  final Function(int) _onImageRemoved;

  @override
  _ImagetileState createState() => _ImagetileState();
}

class _ImagetileState extends State<Imagetile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget._selectedImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                _showRemoveImageDialog(index);
              },
              onTap: () {
                // Handle tap if needed
                _showRemoveImageDialog(index);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(widget._selectedImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showRemoveImageDialog(int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Remove Image"),
          content: const Text("Do you want to remove this image?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                widget._onImageRemoved(index);
                Navigator.of(context).pop();
              },
              child: const Text("Remove"),
            ),
          ],
        );
      },
    );
  }
}
