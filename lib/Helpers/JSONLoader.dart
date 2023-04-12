import 'package:flutter/services.dart' show rootBundle;

class JSONLoader {
  Future<String> loadJsonData(String fileName) async {
    String jsonString = await rootBundle
        .loadString('lib/data/datasources/local/$fileName' '.json');
    return jsonString;
  }
}
