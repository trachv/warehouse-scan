


import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
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
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          label: 'Назад',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save, size: 40),
          label: 'Сохранить',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/homePage');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/getheringList');
        } else {
          FlutterBeep.playSysSound(41);
          context.read<SborProvider>().writeSborToDB();

          // String _text = '';
          // _sborProviderWatch.listCode.forEach((element) {
          //   _text += '''$element;
          //       ${product}__
          //       ${context.watch<SborProvider>().kamera}_
          //       ${context.watch<SborProvider>().volna}_
          //       ${context.watch<SborProvider>().klass};
          //       $product;|''';
          // });
          //productController.clear();
          Navigator.pushNamed(context, '/getheringList');
        }
      },
    );
  }
}