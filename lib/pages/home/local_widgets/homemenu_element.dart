import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMenuElement extends StatelessWidget {
  final Function onTap;
  final String label;
  final IconData icon;

  HomeMenuElement({
    this.onTap,
    this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.green,
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label),
              Icon(icon, size: 100),
            ],
          ),
        ),
      ),
    );
  }
}
