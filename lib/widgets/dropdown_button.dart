import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:provider/provider.dart';

class Dropdown extends StatelessWidget {
  final String label;
  final Function onChangeHandler;

  Dropdown({
    this.label,
    this.onChangeHandler,
  });

  @override
  Widget build(BuildContext context) {
    print('build widget $label');

    String valuefromstate;
    List<String> itemsfromstate;
    if (label == 'Класс') {
      valuefromstate = context.select((SborProvider _prov) => _prov.klass);
      itemsfromstate = context.select((SborProvider _prov) => _prov.listKlass);
    } else if (label == 'Камера') {
      valuefromstate = context.select((SborProvider _prov) => _prov.kamera);
      itemsfromstate = context.select((SborProvider _prov) => _prov.listKamera);
    } else if (label == 'Волна') {
      valuefromstate = context.select((SborProvider _prov) => _prov.volna);
      itemsfromstate = context.select((SborProvider _prov) => _prov.listVolna);
    } else {
      valuefromstate = '';
    }

    return InputDecorator(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.blue, fontSize: 15.0),
          labelText: label,
          contentPadding: EdgeInsets.only(bottom: 0, left: 10),
          hintText: 'Please select expense'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isDense: true,
          dropdownColor: Colors.white,
          onChanged: onChangeHandler,
          value: valuefromstate,
          items: itemsfromstate.map<DropdownMenuItem<String>>((String _value) {
            return DropdownMenuItem<String>(
              value: _value,
              child: Text(_value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
