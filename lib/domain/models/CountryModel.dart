import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CountryModel {
  final String id;
  final String name;
  final String nameAr;
  final String? code;
  final String? country;
  final String? hide;

  CountryModel({
    required this.id,
    required this.name,
    required this.nameAr,
    this.code,
    this.country = '',
    required this.hide,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
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
  final List<CountryModel> data;
  CountryResponseModel({required this.success, required this.data});
  factory CountryResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <CountryModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(CountryModel.fromJson(v));
      });
    }
    return CountryResponseModel(success: json['success'], data: entry);
  }
}
