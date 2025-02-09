import 'dart:io';

import 'package:flutter/material.dart';
import 'package:warehouse_rvp/utils/app_size.dart';

class ShowImageFullScreen extends StatelessWidget {
  const ShowImageFullScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.file(
        File(imagePath),
        width: width,
        height: height,
      ),
    );
  }
}
