import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JSONLoader {
  Future<String> loadJsonData(String fileName) async {
    String jsonString = await rootBundle.loadString('data/$fileName' '.json');
    return jsonString;
  }
}
