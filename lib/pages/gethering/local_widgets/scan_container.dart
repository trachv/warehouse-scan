import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/service/barcode.dart';
import 'package:provider/provider.dart';

class SborContainer extends StatelessWidget {
  SborContainer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 15.0),
                  hintText: '',
                  labelText: 'Штрихкод',
                  contentPadding: EdgeInsets.only(bottom: 0, left: 10),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.left,
                onSubmitted: (String text) {
                  if (text.trim() != '') {
                    context.read<SborProvider>().addListCode(text);
                  }
                },
                autofocus: true,
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => startBarcodeScanStream(context),
              child: Text("Сканировать", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
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
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: context.watch<SborProvider>().listCode.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${context.watch<SborProvider>().listCode[index]}",
                  style: TextStyle(fontSize: 15.0),
                ),
                trailing: Text("${index + 1}"),
              );
            },
          ),
        ),
      ],
    );
  }
}
