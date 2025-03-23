import 'package:flutter/material.dart';

class DataModel {
  final String title;
  final String image;
  final TextAlign textAlignment;
  DataModel({
    required this.title,
    required this.image,
    this.textAlignment = TextAlign.start,
  });
}
