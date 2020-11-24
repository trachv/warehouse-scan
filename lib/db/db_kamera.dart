import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import '../db/db_helper.dart';
import '../model/models.dart';

class DBKamera {
  DBHelper con = new DBHelper();
  String nameTable = 'kamera';

  Future<List<Kamera>> getKamera() async {
    Database db = await con.database;
    List<Map<String, dynamic>> kameraMapList = await db.query(nameTable);
    List<Kamera> kameraList = new List();
    kameraMapList.forEach((Map<String, dynamic> element) {
      kameraList.add(Kamera.fromMap(element));
    });
    return kameraList;
  }

  Future<Kamera> insertKamera(Kamera kamera) async {
    Database db = await con.database;
    print(db);
    kamera.kameraid = await db.insert(nameTable, kamera.toMap());
    print('------------------------------------------${kamera.kameraid}');
    return kamera;
  }

  Future<int> updateKamera(Kamera kamera) async {
    Database db = await con.database;
    return await db.update(
      nameTable,
      kamera.toMap(),
      where: 'kameraid = ?',
      whereArgs: [kamera.kameraid],
    );
  }

  Future<int> deleteKamera(int id) async {
    Database db = await con.database;
    return await db.delete(
      nameTable,
      where: 'kameraid = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearTable() async {
    Database db = await con.database;
    await db.execute(
      'DELETE FROM $nameTable; VACUUM',
    );
  }
}
