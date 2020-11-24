import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String label;

  MyAppBar({this.label});

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label,
        style: TextStyle(fontFamily: 'Roboto'),
      ),
      centerTitle: true,
    );
  }
}
