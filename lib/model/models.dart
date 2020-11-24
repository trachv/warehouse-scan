class Product {
  int productid;
  int productcode;
  String productname;

  Product(this.productid, this.productcode, this.productname);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['productid'] = productid;
    map['productcode'] = productcode;
    map['productname'] = productname;
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    productid = map['productid'];
    productcode = map['productcode'];
    productname = map['productname'];
  }
}

class Kamera {
  int kameraid;
  String kameraname;

  Kamera(this.kameraid, this.kameraname);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['kameraid'] = kameraid;
    map['kameraname'] = kameraname;
    return map;
  }

  Kamera.fromMap(Map<String, dynamic> map) {
    kameraid = map['kameraid'];
    kameraname = map['kameraname'];
  }
}

class Klass {
  int klassid;
  String klassname;

  Klass(this.klassid, this.klassname);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['klassid'] = klassid;
    map['klassname'] = klassname;
    return map;
  }

  Klass.fromMap(Map<String, dynamic> map) {
    klassid = map['klassid'];
    klassname = map['klassname'];
  }
}

class Scanhist {
  int scanhistid;
  String scanhistbarcode;
  String scanhistdate;

  Scanhist(this.scanhistid, this.scanhistbarcode, this.scanhistdate);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['scanhistid'] = scanhistid;
    map['scanhistbarcode'] = scanhistbarcode;
    map['scanhistdate'] = scanhistdate;
    return map;
  }

  Scanhist.fromMap(Map<String, dynamic> map) {
    scanhistid = map['scanhistid'];
    scanhistbarcode = map['scanhistbarcode'];
    scanhistdate = map['scanhistdate'];
  }
}

class Sbor {
  int sborid;
  String sborproduct;
  String sborkamera;
  String sborklass;
  String sborvolna;
  String sbordate;
  int sborisnew;

  Sbor(
      {this.sborid,
      this.sborproduct,
      this.sborkamera,
      this.sborklass,
      this.sborvolna,
      this.sbordate,
      this.sborisnew});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['sborid'] = sborid;
    map['sborproduct'] = sborproduct;
    map['sborkamera'] = sborkamera;
    map['sborklass'] = sborklass;
    map['sborvolna'] = sborvolna;
    map['sbordate'] = sbordate;
    map['sborisnew'] = sborisnew;
    return map;
  }

  Sbor.fromMap(Map<String, dynamic> map) {
    sborid = map['sborid'];
    sborproduct = map['sborproduct'];
    sborkamera = map['sborkamera'];
    sborklass = map['sborklass'];
    sborvolna = map['sborvolna'];
    sbordate = map['sbordate'];
    sborisnew = map['sborisnew'];
  }
}

class SborDetails {
  int sbordetailsid;
  int sbordetailssborid;
  String sbordetailsbarcode;

  SborDetails(
      this.sbordetailsid, this.sbordetailssborid, this.sbordetailsbarcode);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['sbordetailsid'] = sbordetailsid;
    map['sbordetailssborid'] = sbordetailssborid;
    map['sbordetailsbarcode'] = sbordetailsbarcode;
    return map;
  }

  SborDetails.fromMap(Map<String, dynamic> map) {
    sbordetailsid = map['sbordetailsid'];
    sbordetailssborid = map['sbordetailssborid'];
    sbordetailsbarcode = map['sbordetailsbarcode'];
  }
}
