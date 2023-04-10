import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SizesModel {
  final String id;
  final String name;
  final String nameAr;
  final String? code;
  final String? country;
  final String? hide;

  SizesModel({
    required this.id,
    required this.name,
    required this.nameAr,
    this.code,
    this.country = '',
    required this.hide,
  });

  factory SizesModel.fromJson(Map<String, dynamic> json) {
    return SizesModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      code: json['code'],
      country: json['country_id'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class CountryResponseModel {
  final bool success;
  final List<SizesModel> data;
  CountryResponseModel({required this.success, required this.data});
  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <SizesModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(SizesModel.fromJson(v));
      });
    }
    return CountryResponseModel(success: json['success'], data: entry);
  }
}
