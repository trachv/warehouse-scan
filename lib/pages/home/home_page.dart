import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/widgets/app_bar.dart';
import 'package:wh01/service/sync_data.dart';
import 'local_widgets/homemenu_element.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    _loadListDropdown();
    super.initState();
  }

  void _loadListDropdown() async {
    await context.read<SborProvider>().listKameraString();
    await context.read<SborProvider>().listKlassString();
  }

  _showLoadingData(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress.showWithText('Loading...');
    await fethData();
    _loadListDropdown();
    progress.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(label: 'Сбор грибов'),
      body: ProgressHUD(
        child: Builder(
          builder: (BuildContext context) => Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: .90,
                    children: [
                      HomeMenuElement(
                          onTap: () {
                            Navigator.pushNamed(context, '/getheringList');
                          },
                          label: 'Сбор грибов',
                          icon: Icons.content_cut),
                      HomeMenuElement(
                          onTap: () {
                            Navigator.pushNamed(context, '/underConstraction');
                          },
                          label: 'Производство',
                          icon: Icons.content_cut),
                      HomeMenuElement(
                          onTap: () {
                            Navigator.pushNamed(context, '/underConstraction');
                          },
                          label: 'Перемещение',
                          icon: Icons.content_cut),
                      HomeMenuElement(
                          onTap: () {
                            Navigator.pushNamed(context, '/underConstraction');
                          },
                          label: 'Отгрузка',
                          icon: Icons.content_cut),
                      HomeMenuElement(
                          onTap: () {
                            Navigator.pushNamed(context, '/underConstraction');
                          },
                          label: 'Инвентаризация',
                          icon: Icons.content_cut),
                      HomeMenuElement(
                          onTap: () {
                            _showLoadingData(context);
                          },
                          label: 'Синхронизация',
                          icon: Icons.sync),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
