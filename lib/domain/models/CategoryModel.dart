import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CategoryModel {
  final String id;
  final String? shopId;
  final String? catId;
  final String name;
  final String nameAr;
  final String? special;
  final String? slug;
  final String? img;
  final String? specialImg;
  final String? offerImg;
  final String? sizeImg;
  final String? hide;

  CategoryModel({
    required this.id,
    required this.shopId,
    required this.catId,
    required this.name,
    required this.nameAr,
    required this.special,
    required this.slug,
    required this.img,
    required this.specialImg,
    required this.offerImg,
    required this.sizeImg,
    required this.hide,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      shopId: json['shop_id'],
      catId: json['cat_id'],
      name: json['name'],
      nameAr: json['name_ar'],
      special: json['special'],
      slug: json['slug'],
      img: json['img'],
      specialImg: json['special_img'],
      offerImg: json['offer_img'],
      sizeImg: json['size_img'],
      hide: json['hide'],
    );
  }
}

@JsonSerializable()
class CategoryResponseModel {
  final bool success;
  final List<CategoryModel> data;
  CategoryResponseModel({required this.success, required this.data});
  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <CategoryModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(CategoryModel.fromJson(v));
      });
    }
    return CategoryResponseModel(success: json['success'], data: entry);
  }
}
