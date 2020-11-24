import 'package:flutter/material.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:provider/provider.dart';
import 'package:wh01/service/settings.dart';

class Scantable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _lc = context.select((SborProvider obj) => obj.listCode);
    print('build widget Scantable');
    return Flexible(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
            padding: EdgeInsets.all(0.0),
            child: ListTile(
              title: Text(
                'Штрихкод',
                style: TextStyle(fontSize: 15.0),
              ),
              trailing: Text('№'),
            ),
          ),
          SizedBox(
            height: Settings().height(context) * 0.015,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _lc.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${_lc[index]}",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  trailing: Text("${index + 1}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}