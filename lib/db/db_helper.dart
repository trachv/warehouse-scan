import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import '../service/file_work.dart';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  factory DBHelper() => _instance;

  static Database _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDB();
    return _db;
  }

  DBHelper.internal();

  Future<Database> _initDB() async {
    String path = await getLocalPath();
    return await openDatabase(
      '${path}main.db',
      version: 3,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE product(
        productid INTEGER PRIMARY KEY AUTOINCREMENT, 
        productcode INTEGER, 
        productname TEXT
        )''',
    );
    await db.execute(
      '''CREATE TABLE kamera(
        kameraid INTEGER PRIMARY KEY AUTOINCREMENT, 
        kameraname TEXT
        )''',
    );
    await db.execute(
      '''CREATE TABLE klass(
        klassid INTEGER PRIMARY KEY AUTOINCREMENT, 
        klassname TEXT
        )''',
    );
    await db.execute(
      '''CREATE TABLE scanhist(
        scanhistid INTEGER PRIMARY KEY AUTOINCREMENT, 
        scanhistbarcode TEXT, 
        scanhistdate TEXT
        )''',
    );
    await db.execute('''
      CREATE TABLE sbor(
        sborid INTEGER PRIMARY KEY AUTOINCREMENT,
        sborproduct TEXT,
        sborkamera TEXT,
        sborklass TEXT,
        sborvolna TEXT,
        sbordate TEXT,
        sborisnew INTEGER
      )      
      ''');
    await db.execute('''
      CREATE TABLE sbordetails(
        sbordetailsid INTEGER PRIMARY KEY AUTOINCREMENT,
        sbordetailssborid INREGER,
        sbordetailsbarcode TEXT
      )      
      ''');
  }
}
