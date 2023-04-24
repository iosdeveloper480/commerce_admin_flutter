import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String shopId;
  final String cat;
  final String subId;
  final String name;
  final String nameAr;
  final String slug;
  final String details;
  final String detailsAr;
  final String custom;
  final String img;
  final String price;
  final String maxQuantity;
  final String rate;
  final String discountType;
  final String discountValue;
  final String status;
  final String hide;

  ProductModel({
    required this.id,
    required this.shopId,
    required this.cat,
    required this.subId,
    required this.name,
    required this.nameAr,
    required this.slug,
    required this.details,
    required this.detailsAr,
    required this.custom,
    required this.img,
    required this.price,
    required this.maxQuantity,
    required this.rate,
    required this.discountType,
    required this.discountValue,
    required this.status,
    required this.hide,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return ProductModel(
      id: json['id'],
      shopId: json['shop_id'],
      cat: json['cat'],
      subId: json['sub_id'],
      name: json['name'],
      nameAr: json['name_ar'],
      slug: json['slug'],
      details: json['details'],
      detailsAr: json['details_ar'],
      custom: json['custom'],
      img: json['img'],
      price: json['price'],
      maxQuantity: json['max_quantity'],
      rate: json['rate'],
      discountType: json['discount_type'],
      discountValue: json['discount_value'],
      status: json['status'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class ProductResponseModel {
  final bool success;
  final List<ProductModel> data;
  ProductResponseModel({
    required this.success,
    required this.data,
  });
  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <ProductModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(ProductModel.fromJson(v));
      });
    }
    return ProductResponseModel(success: json['success'], data: entry);
  }
}
