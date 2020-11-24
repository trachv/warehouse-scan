import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:provider/provider.dart';
import 'package:wh01/providers/sbor_provider.dart';

startBarcodeScanStream(BuildContext context) async {
  FlutterBarcodeScanner.getBarcodeStreamReceiver(
          "#ff6666", "Cancel", true, ScanMode.BARCODE)
      .listen((barcode) {
    if (barcode != '-1') {
      FlutterBeep.playSysSound(AndroidSoundIDs.TONE_CDMA_ABBR_ALERT);
      context.read<SborProvider>().addListCode(barcode);
    }
  });
}

// Platform messages are asynchronous, so we initialize in an async method.
Future<void> scanBarcodeNormal(BuildContext context, bool mounted) async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);
    print(barcodeScanRes);
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  if (!mounted) return;

  // setState(() {
  //   _scanBarcode = barcodeScanRes;
  //   if (_scanBarcode != '-1') {
  //     listCode.add(_scanBarcode);
  //   }
  // });
}
