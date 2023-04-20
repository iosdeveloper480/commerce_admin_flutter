import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CustomerModel {
  final String id;
  final String userId;
  final String name;
  final String img;
  final String firebase;
  final String phone;
  final String email;
  final String gender;
  final String device;
  final String version;
  final String lang;
  final String block;
  final String date;
  final String enable;
  final String availableSizes;

  CustomerModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.img,
    required this.firebase,
    required this.phone,
    required this.email,
    required this.gender,
    required this.device,
    required this.version,
    required this.lang,
    required this.block,
    required this.date,
    required this.enable,
    required this.availableSizes,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return CustomerModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      img: json['img'],
      firebase: json['firebase'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
      device: json['device'],
      version: json['version'],
      lang: json['lang'],
      block: json['block'],
      date: json['date'],
      enable: json['enable'],
      availableSizes: json['available_sizes'],
    );
  }
}

@JsonSerializable()
class CustomerResponseModel {
  final bool success;
  final List<CustomerModel> data;
  CustomerResponseModel({
    required this.success,
    required this.data,
  });
  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <CustomerModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(CustomerModel.fromJson(v));
      });
    }
    return CustomerResponseModel(success: json['success'], data: entry);
  }
}
