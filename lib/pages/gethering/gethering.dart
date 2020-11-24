import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wh01/widgets/app_bar.dart';
import 'package:wh01/service/settings.dart';
import 'local_widgets/bottom_navbar.dart';
import 'local_widgets/head_document.dart';
import 'local_widgets/scan_table.dart';

class Gethering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild page gathering');
    return Scaffold(
      appBar: MyAppBar(label: 'Сбор грибов'),
      body: BodyContainer(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build widget bodycontainer');
    return Container(
      padding: EdgeInsets.only(
        left: Settings().width(context) * 0.03,
        right: Settings().width(context) * 0.03,
        top: Settings().height(context) * 0.02,
      ),
      child: Column(
        children: [
          HeadDocument(),
          Scantable(),
        ],
      ),
    );
  }
}
