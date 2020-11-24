import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarList extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sync, size: 40),
          label: 'Обновить',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/homePage');
        } else {}
      },
    );
  }
}
