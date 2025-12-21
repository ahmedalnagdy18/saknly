import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saknly/core/fonts/app_text.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  XFile? uploadedImage;
  Future<void> pickImage({required ImageSource source}) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      uploadedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Test",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              Text("Add image here", style: AppTexts.smallHeading),
              SizedBox(height: 12),
              InkWell(
                onTap: () {
                  if (uploadedImage == null) {
                    pickImage(source: ImageSource.gallery);
                  } else {
                    uploadedImage = null;
                    setState(() {});
                  }
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: uploadedImage == null
                      ? Center(
                          child: Text("Upload your image"),
                        )
                      : Image.file(
                          File(uploadedImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
