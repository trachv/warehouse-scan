import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/widgets/app_bar.dart';
import 'local_widgets/botton_navbar_list.dart';
import 'local_widgets/gathering_list_view.dart';

class GetheringList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(label: 'Сбор грибов: список'),
      body: Column(
        children: [
          Expanded(
            child: GetheringListView(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SborProvider>().updateCurrentSbor();
          Navigator.pushNamed(context, '/gethering');
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
