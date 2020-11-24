import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/pages/gethering/gethering.dart';
import 'package:wh01/pages/underСonstruction.dart';
import 'package:wh01/pages/gethering_list/gethering_list.dart';
import 'package:wh01/pages/home/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => SborProvider(),
      )
    ],
    child: WareHouseApp(),
  ));
}

class WareHouseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: '/homePage',
      routes: {
        '/getheringList': (context) => GetheringList(),
        '/homePage': (context) => HomePage(),
        '/underConstraction': (content) => UnderConstraction(),
        '/gethering': (content) => Gethering(),
      },
    );
  }
}
