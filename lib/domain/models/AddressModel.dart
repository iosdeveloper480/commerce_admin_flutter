import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AddressModel {
  final String id;
  final String userId;
  final String name;
  final String details;
  final String country;
  final String city;
  final String flat;
  final String phone;
  final String latitude;
  final String longitude;
  final String hide;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.details,
    required this.country,
    required this.city,
    required this.flat,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.hide,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return AddressModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      details: json['details'],
      country: json['country'],
      city: json['city'],
      flat: json['flat'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class AddressResponseModel {
  final bool success;
  final List<AddressModel> data;
  AddressResponseModel({
    required this.success,
    required this.data,
  });
  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <AddressModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(AddressModel.fromJson(v));
      });
    }
    return AddressResponseModel(success: json['success'], data: entry);
  }
}
