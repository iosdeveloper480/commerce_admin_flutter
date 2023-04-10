import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SliderModel {
  final String id;
  final String? type;
  final String? shopId;
  final String? banner;
  final String? cat;
  final String? img;
  final String? name;
  final String? nameAr;
  final String? linkId;
  final String? link;
  final String? hide;

  SliderModel({
    required this.id,
    required this.type,
    required this.shopId,
    required this.banner,
    required this.cat,
    required this.img,
    required this.name,
    required this.nameAr,
    required this.linkId,
    required this.link,
    required this.hide,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      type: json['type'],
      shopId: json['shop_id'],
      banner: json['banner'],
      cat: json['cat'],
      img: json['img'],
      name: json['name'],
      nameAr: json['name_ar'],
      linkId: json['link_id'],
      link: json['link'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class SliderResponseModel {
  final bool success;
  final List<SliderModel> data;
  SliderResponseModel({
    required this.success,
    required this.data,
  });
  factory SliderResponseModel.forAppAlerts(Map<String, dynamic> json) {
    var entry = <SliderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['hide'] == '0') {
          entry.add(SliderModel.fromJson(v));
        }
      });
    }
    return SliderResponseModel(success: json['success'], data: entry);
  }
  factory SliderResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <SliderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['hide'] == '0' && v['banner'] == '0') {
          entry.add(SliderModel.fromJson(v));
        }
      });
    }
    return SliderResponseModel(success: json['success'], data: entry);
  }
  factory SliderResponseModel.fromJson2(Map<String, dynamic> json) {
    var entry = <SliderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['hide'] == '0' && v['banner'] == '1') {
          entry.add(SliderModel.fromJson(v));
        }
      });
    }
    return SliderResponseModel(success: json['success'], data: entry);
  }
}
