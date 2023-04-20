import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CouponModel {
  final String id;
  final String code;
  final String name;
  final String nameAr;
  final String type;
  final String value;
  final String date;
  final String used;
  final String max;
  final String cap;
  final String status;
  final String expiry;
  final String createdBy;
  final String hide;

  CouponModel({
    required this.id,
    required this.code,
    required this.name,
    required this.nameAr,
    required this.type,
    required this.value,
    required this.date,
    required this.used,
    required this.max,
    required this.cap,
    required this.status,
    required this.expiry,
    required this.createdBy,
    required this.hide,
  });
  factory CouponModel.fromJson(Map<String, dynamic> json) {
// json.forEach((key, value) {
//   if (value == null) {
//     print('$key is null');
//   }
// });
    return CouponModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      nameAr: json['name_ar'],
      type: json['type'],
      value: json['value'],
      date: json['date'],
      used: json['used'],
      max: json['max'],
      cap: json['cap'],
      status: json['status'],
      expiry: json['expiry'],
      createdBy: json['created_by'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class CouponResponseModel {
  final bool success;
  final List<CouponModel> data;
  CouponResponseModel({
    required this.success,
    required this.data,
  });
  factory CouponResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <CouponModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(CouponModel.fromJson(v));
      });
    }
    return CouponResponseModel(success: json['success'], data: entry);
  }
}
