import 'package:flutter/cupertino.dart';
import 'package:wh01/service/db/db_kamera.dart';
import 'package:wh01/service/db/db_klass.dart';
import 'package:wh01/service/db/db_sbor.dart';
import 'package:wh01/model/models.dart';

class SborProvider extends ChangeNotifier {
  String _product;
  String get product => _product;
  void changeProduct(String valueProduct) {
    _product = valueProduct;
    notifyListeners();
  }

  String _sbordate;
  String get sbordate => _sbordate;

  String _kamera;
  String get kamera => _kamera;
  void changeKamera(String valueKamera) {
    _kamera = valueKamera;
    notifyListeners();
  }

  String _klass;
  String get klass => _klass;
  void changeKlass(String valueKlass) {
    _klass = valueKlass;
    notifyListeners();
  }

  String _volna;
  String get volna => _volna;
  void changeVolna(String valueVolna) {
    _volna = valueVolna;
    notifyListeners();
  }

  int _sborid = 1;
  int get sborid => _sborid;
  void changeIsNew(int sboridvalue) {
    _sborid = sboridvalue;
    notifyListeners();
  }

  List<String> _listKlass = [];
  List<String> get listKlass => List.from(_listKlass);

  List<String> _listKamera = [];
  List<String> get listKamera => List.from(_listKamera);

  Future<void> listKlassString() async {
    List<Klass> _futurelistKlass = await DBKlass().getKlass();
    _listKlass.clear();
    _futurelistKlass.forEach((elKlass) {
      _listKlass.add(elKlass.klassname);
    });
    notifyListeners();
  }

  Future<void> listKameraString() async {
    List<Kamera> _futurelistKamera = await DBKamera().getKamera();
    _listKamera.clear();
    _futurelistKamera.forEach((elKlass) {
      _listKamera.add(elKlass.kameraname);
    });
    notifyListeners();
  }

  List<String> get listVolna => ['1', '2', '3'];

  List<String> _listCode = [];
  List<String> get listCode => List.from(_listCode);

  void addListCode(String barCode) {
    _listCode.add(barCode);
    notifyListeners();
  }

  void clearListCode() {
    _listCode.clear();
  }

  void updateCurrentSbor([Sbor _sbor]) {
    if (_sbor == null) {
      _product = null;
      _kamera = null;
      _klass = null;
      _volna = null;
      _sborid = null;
      _sbordate = null;
      _listCode = [];
    } else {
      _sborid = _sbor.sborid;
      _product = _sbor.sborproduct;
      _kamera = _sbor.sborkamera;
      _klass = _sbor.sborklass;
      _volna = _sbor.sborvolna;
      _sbordate = _sbor.sbordate;
      getListCode(_sborid);
    }
  }

  List<Sbor> _gethetinglist = [];
  List<Sbor> get getheringlist => _gethetinglist;
  void changegetheringlist(List<Sbor> _listS) {
    _gethetinglist = _listS;
    notifyListeners();
  }

  Future<int> writeSborToDB() async {
    if (_sborid == null) {
      _sbordate = DateTime.now().toString();
    }
    Sbor _sbor = Sbor(
      sborid: _sborid,
      sborproduct: _product,
      sborkamera: _kamera,
      sborklass: _klass,
      sborvolna: _volna,
      sbordate: _sbordate,
      sborisnew: 0,
    );
    if (_sborid == null) {
      _sborid = await DBSbor().insertSbor(_sbor);
    } else {
      await DBSbor().updateSbor(_sbor);
    }
    await DBSbor().deletetListCode(_sborid);
    await DBSbor().insertList(_listCode, _sborid);
    return _sborid;
  }

  Future<void> deletesbor(int _sborid) async {
    DBSbor dbSbor = DBSbor();
    await dbSbor.deletetListCode(_sborid);
    await dbSbor.deleteSbor(_sborid);
  }

  Future<List<Sbor>> getheringList() async {
    DBSbor dbSbor = DBSbor();
    return await dbSbor.getSborList();
  }

  Future<void> getListCode(int sborid) async {
    DBSbor dbSbor = DBSbor();
    _listCode = await dbSbor.getListCodeFromDB(sborid);
  }
}
