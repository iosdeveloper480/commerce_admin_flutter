import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AppDataModel {
  final String id;
  final String name;
  final String nameAr;
  final String details;
  final String detailsAr;
  final String hide;

  AppDataModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.details,
    required this.detailsAr,
    required this.hide,
  });
  factory AppDataModel.fromJson(Map<String, dynamic> json) {
// json.forEach((key, value) {
//   if (value == null) {
//     print('$key is null');
//   }
// });
    return AppDataModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      details: json['details'],
      detailsAr: json['details_ar'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class AppDataResponseModel {
  final bool success;
  final List<AppDataModel> data;
  AppDataResponseModel({
    required this.success,
    required this.data,
  });
  factory AppDataResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <AppDataModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(AppDataModel.fromJson(v));
      });
    }
    return AppDataResponseModel(success: json['success'], data: entry);
  }
}
