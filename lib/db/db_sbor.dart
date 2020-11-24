import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import '../model/models.dart';

class DBSbor {
  DBHelper con = new DBHelper();
  String nameTable = 'sbor';

  Future<List<Sbor>> getSborList() async {
    Database db = await con.database;
    List<Map<String, dynamic>> sborMapList = await db.query(nameTable);
    List<Sbor> sborList = new List();
    sborMapList.forEach((Map<String, dynamic> element) {
      sborList.add(Sbor.fromMap(element));
    });
    return sborList;
  }

  Future<List<String>> getListCodeFromDB(int sborid) async {
    Database db = await con.database;
    List<Map<String, dynamic>> codeMapList = await db.query(
      'sbordetails',
      where: 'sbordetailssborid = ?',
      whereArgs: [sborid],
    );
    List<String> codeList = new List();
    codeMapList.forEach((Map<String, dynamic> element) {
      codeList.add(SborDetails.fromMap(element).sbordetailsbarcode);
    });
    return codeList;
  }

  Future<Sbor> getSbor(Sbor sbor) async {
    Database db = await con.database;
    List<Map<String, dynamic>> sborMap = await db.query(
      nameTable,
      where: 'sborid = ?',
      whereArgs: [sbor.sborid],
    );
    Sbor _sbor;
    if (sborMap.length != 0) {
      _sbor = Sbor.fromMap(sborMap[0]);
    }
    return _sbor;
  }

  Future<int> insertSbor(Sbor sbor) async {
    Database db = await con.database;
    return await db.insert(nameTable, sbor.toMap());
  }

  Future<int> insertList(List<String> dataCode, int sborid) async {
    Database db = await con.database;
    await db.transaction((txn) async {
      final batch = txn.batch();
      dataCode.forEach((String element) async {
        batch.insert('sbordetails', SborDetails(null, sborid, element).toMap());
      });
      await batch.commit();
    });
    return 1;
  }

  Future<int> deletetListCode(int sborid) async {
    Database db = await con.database;
    await db.transaction((txn) async {
      final batch = txn.batch();
      batch.delete(
        'sbordetails',
        where: 'sbordetailssborid = ?',
        whereArgs: [sborid],
      );
      await batch.commit();
    });
    return 1;
  }

  Future<int> updateSbor(Sbor sbor) async {
    Database db = await con.database;
    return await db.update(
      nameTable,
      sbor.toMap(),
      where: 'sborid = ?',
      whereArgs: [sbor.sborid],
    );
  }

  Future<int> deleteSbor(int id) async {
    Database db = await con.database;
    return await db.delete(
      nameTable,
      where: 'sborid = ?',
      whereArgs: [id],
    );
  }

  void clearTable() async {
    Database db = await con.database;
    await db.execute(
      'DELETE FROM $nameTable; VACUUM',
    );
  }
}
