import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> getLocalPath() async {
  final directoty = await getApplicationDocumentsDirectory();
  return directoty.path;
}

Future<File> _getLocalFile(String fileName) async {
  final path = await getLocalPath();
  return File('$path/$fileName.txt');
}

Future<File> writeTextLocalFile(String fileName, String text) async {
  final file = await _getLocalFile(fileName);
  return file.writeAsString(text);
}

Future<void> deleteFiles() async {
  final _systemTempDir = await getApplicationDocumentsDirectory();

  _systemTempDir
      .list(recursive: true, followLinks: false)
      .listen((FileSystemEntity entity) async {
    try {
      final file = File(entity.path);

      await file.delete();
    } catch (e) {}
  });
}

Future<void> deleteFile(String fileName) async {
  try {
    final file = File(fileName);
    await file.delete();
  } catch (e) {
    print(e);
  }
}
