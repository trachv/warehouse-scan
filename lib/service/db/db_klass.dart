import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import 'package:wh01/model/models.dart';

class DBKlass {
  DBHelper con = new DBHelper();
  String nameTable = 'klass';

  Future<List<Klass>> getKlass() async {
    Database db = await con.database;
    List<Map<String, dynamic>> klassMapList = await db.query(nameTable);
    List<Klass> klassList = new List();
    klassMapList.forEach((Map<String, dynamic> element) {
      klassList.add(Klass.fromMap(element));
    });
    return klassList;
  }

  Future<Klass> insertKlass(Klass klass) async {
    Database db = await con.database;
    klass.klassid = await db.insert(nameTable, klass.toMap());
    return klass;
  }

  Future<int> updateKlass(Klass klass) async {
    Database db = await con.database;
    return await db.update(
      nameTable,
      klass.toMap(),
      where: 'klassid = ?',
      whereArgs: [klass.klassid],
    );
  }

  Future<int> deleteKlass(int id) async {
    Database db = await con.database;
    return await db.delete(
      nameTable,
      where: 'klassid = ?',
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
