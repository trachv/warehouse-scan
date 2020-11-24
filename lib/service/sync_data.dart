import 'package:http/http.dart' as http;
import 'package:wh01/service/db/db_kamera.dart';
import 'package:wh01/service/db/db_klass.dart';
import 'package:wh01/service/db/db_scanhist.dart';
import 'package:wh01/model/models.dart';

Future<void> fethData() async {
  final String baseUrl = "http://93.171.163.171:82/ws1/hs/index";

  try {
    final _kameraRequest = await http.get('$baseUrl/getstore');

    if (_kameraRequest.statusCode == 200) {
      List<String> dataKamera;
      dataKamera = _kameraRequest.body.split(';');
      DBKamera con = DBKamera();
      await con.clearTable();
      dataKamera.forEach((String kamera) async {
        await con.insertKamera(Kamera(null, kamera));
      });
    } else {
      //throw Exception('Ошибка загрузки камер: ${_kameraRequest.statusCode}');
    }
  } on Exception catch (e) {
    //throw Exception('Ошибка доступа к серверу $e');
    print(e);
  }

  try {
    print('start klass');
    final _klassRequest = await http.get('$baseUrl/getclass');

    if (_klassRequest.statusCode == 200) {
      List<String> dataKlass;
      dataKlass = _klassRequest.body.split(';');
      DBKlass con = DBKlass();
      await con.clearTable();
      dataKlass.forEach((String klass) async {
        await con.insertKlass(Klass(null, klass));
      });
    } else {
      //throw Exception('Ошибка загрузки классов: ${_klassRequest.statusCode}');
    }
  } on Exception catch (e) {
    //throw Exception('Ошибка доступа к серверу $e');
    print(e);
  }

  try {
    final _scanhistRequest = await http.get('$baseUrl/getshkproducts_hist');

    if (_scanhistRequest.statusCode == 200) {
      List<String> dataScanhist;
      dataScanhist = _scanhistRequest.body.split(';');
      DBScanhist con = DBScanhist();
      await con.clearTable();
      await con.insertList(dataScanhist);
    } else {
      //throw Exception('Ошибка загрузки классов: ${_klassRequest.statusCode}');
    }
  } on Exception catch (e) {
    //throw Exception('Ошибка доступа к серверу $e');
    print(e);
  }
}
