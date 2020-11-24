import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderConstraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сбор грибов'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Страница в разработке',
              style: TextStyle(fontSize: 25),
            ),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/images/home-slider.gif'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
