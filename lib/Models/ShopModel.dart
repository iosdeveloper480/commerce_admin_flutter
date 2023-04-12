import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ShopModel {
  final String id;
  final String name;
  final String nameAr;
  final String phone;
  final String country;
  final String city;
  final String address;
  final String latitude;
  final String longitude;
  final String details;
  final String detailsAr;
  final String email;
  final String createdAt;
  final String createdby;
  final String img;
  final String rate;
  final String reviews;
  final String view;
  final String status;
  final String comm;
  final String expiry;
  final String close;
  final String hide;

  ShopModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.phone,
    required this.country,
    required this.city,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.details,
    required this.detailsAr,
    required this.email,
    required this.createdAt,
    required this.createdby,
    required this.img,
    required this.rate,
    required this.reviews,
    required this.view,
    required this.status,
    required this.comm,
    required this.expiry,
    required this.close,
    required this.hide,
  });

  factory ShopModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShopModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      phone: json['phone'],
      country: json['country'],
      city: json['city'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      details: json['details'],
      detailsAr: json['details_ar'],
      email: json['email'],
      createdAt: json['created_at'],
      createdby: json['createdby'],
      img: json['img'],
      rate: json['rate'],
      reviews: json['reviews'],
      view: json['view'],
      status: json['status'],
      comm: json['comm'],
      expiry: json['expiry'],
      close: json['close'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class ShopsResponseModel {
  final bool success;
  final List<ShopModel> data;
  ShopsResponseModel({
    required this.success,
    required this.data,
  });
  factory ShopsResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <ShopModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(ShopModel.fromJson(v));
      });
    }
    return ShopsResponseModel(success: json['success'], data: entry);
  }
}
