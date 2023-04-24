import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ShopUserModel {
  final String id;
  final String shopId;
  final String name;
  final String userName;
  final String pass;
  final String role;
  final String main;
  final String status;
  final String? firebase;
  final String notifications;
  final String lang;
  final String hide;

  ShopUserModel({
    required this.id,
    required this.shopId,
    required this.name,
    required this.userName,
    required this.pass,
    required this.role,
    required this.main,
    required this.status,
    required this.firebase,
    required this.notifications,
    required this.lang,
    required this.hide,
  });
  factory ShopUserModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return ShopUserModel(
      id: json['id'],
      shopId: json['shop_id'],
      name: json['name'],
      userName: json['user_name'],
      pass: json['pass'],
      role: json['role'],
      main: json['main'],
      status: json['status'],
      firebase: json['firebase'],
      notifications: json['notifications'],
      lang: json['lang'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class ShopUserResponseModel {
  final bool success;
  final List<ShopUserModel> data;
  ShopUserResponseModel({
    required this.success,
    required this.data,
  });
  factory ShopUserResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <ShopUserModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(ShopUserModel.fromJson(v));
      });
    }
    return ShopUserResponseModel(success: json['success'], data: entry);
  }
}
