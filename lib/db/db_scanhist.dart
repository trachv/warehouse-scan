import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import '../model/models.dart';

class DBScanhist {
  DBHelper con = new DBHelper();
  String nameTable = 'scanhist';

  Future<List<Scanhist>> getData() async {
    Database db = await con.database;
    List<Map<String, dynamic>> _mapList = await db.query(nameTable);
    List<Scanhist> _list = new List();
    _mapList.forEach((Map<String, dynamic> element) {
      _list.add(Scanhist.fromMap(element));
    });
    return _list;
  }

  Future<Scanhist> insert(Scanhist scanhist) async {
    Database db = await con.database;
    scanhist.scanhistid = await db.insert(nameTable, scanhist.toMap());
    return scanhist;
  }

  Future<int> insertList(List<String> dataScanhist) async {
    Database db = await con.database;
    await db.transaction((txn) async {
      final batch = txn.batch();
      dataScanhist.forEach((String element) async {
        List<String> _lineScan = element.split('|');
        batch.insert(
            nameTable, Scanhist(null, _lineScan[0], _lineScan[2]).toMap());
      });
      await batch.commit();
    });
    return 1;
  }

  Future<void> clearTable() async {
    Database db = await con.database;
    await db.execute(
      'DELETE FROM $nameTable; VACUUM',
    );
  }
}
