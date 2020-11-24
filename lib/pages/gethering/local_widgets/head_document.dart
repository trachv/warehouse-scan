import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wh01/providers/sbor_provider.dart';
import 'package:wh01/service/barcode.dart';
import 'package:wh01/service/settings.dart';
import 'package:wh01/widgets/dropdown_button.dart';
import 'package:provider/provider.dart';

class HeadDocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build widget headdocument');
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ProductField(),
            ),
            SizedBox(
              width: Settings().height(context) * 0.015,
            ),
            Flexible(
              child: Dropdown(
                label: 'Камера',
                onChangeHandler: (String value) =>
                    context.read<SborProvider>().changeKamera(value),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Settings().height(context) * 0.015,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Dropdown(
                label: 'Класс',
                onChangeHandler: (String value) =>
                    context.read<SborProvider>().changeKlass(value),
              ),
            ),
            SizedBox(
              width: Settings().height(context) * 0.015,
            ),
            Flexible(
              child: Dropdown(
                label: 'Волна',
                onChangeHandler: (String value) =>
                    context.read<SborProvider>().changeVolna(value),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Settings().height(context) * 0.015,
        ),
        Row(
          children: [
            Flexible(
              child: InputCode(),
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
          height: Settings().height(context) * 0.015,
        ),
      ],
    );
  }
}

class ProductField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build widget ProductField');
    final productController = TextEditingController();
    productController.text = context.select((SborProvider obj) => obj.product);
    return TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.blue, fontSize: 15.0),
        hintText: '',
        labelText: 'Код продукции',
        contentPadding: EdgeInsets.only(bottom: 0, left: 10),
      ),
      controller: productController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      onChanged: (String text) {},
      onSubmitted: (String text) {
        context.read<SborProvider>().changeProduct(productController.text);
      },
    );
  }
}

class InputCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build widget InputCode');
    final _contr = TextEditingController();
    return TextField(
      controller: _contr,
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
          _contr.text = '';
        }
      },
      autofocus: true,
    );
  }
}
