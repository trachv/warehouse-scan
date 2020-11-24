import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/model/models.dart';

class GetheringListView extends StatelessWidget {
  Future<void> _showMyDialog(Sbor _sbor, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Предупреждение!'),
          content: SingleChildScrollView(
            child: Text('Удалить выбранный документ'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Да'),
              onPressed: () async {
                await context.read<SborProvider>().deletesbor(_sbor.sborid);
                final List<Sbor> _glist =
                    await Provider.of<SborProvider>(context, listen: false)
                        .getheringList();
                context.read<SborProvider>().changegetheringlist(_glist);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    _listViewBuilder(_data) {
      return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: InkWell(
              onLongPress: () {
                _showMyDialog(_data[index], context);
              },
              onTap: () {
                Navigator.pushNamed(context, '/gethering');
                context.read<SborProvider>().updateCurrentSbor(_data[index]);
              },
              splashColor: Colors.green,
              highlightColor: Colors.red,
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("Сбор грибов от ${_data[index].sbordate}"),
                      subtitle: Text(
                          '''Продукция: ${_data[index].sborproduct}, Камера: ${_data[index].sborkamera}, Волна: ${_data[index].sborvolna} , Класс: ${_data[index].sborklass}'''),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Future<List<Sbor>> slist =
        Provider.of<SborProvider>(context).getheringList();

    return FutureBuilder<List<Sbor>>(
      future: slist,
      builder: (BuildContext context, AsyncSnapshot<List<Sbor>> snapshot) {
        print('snapshot data - ${snapshot.data}');

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return Center(child: Text('no data'));
          } else {
            return _listViewBuilder(snapshot.data);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          ); // loading
        }
      },
    );
  }
}
