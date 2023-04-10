import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SizesModel {
  final String id;
  final String name;
  final String nameAr;
  final String cat;
  final String? img;
  final String? hide;
  final List<String> categories;

  SizesModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.cat,
    required this.hide,
    required this.categories,
    required this.img,
  });

  factory SizesModel.fromJson(
    Map<String, dynamic> json,
    List<CategoryModel> categories2,
  ) {
    List<String> catArray = [];
    String cat = json['cat'];
    List<String> catList = cat.split(',');
    for (String item in catList) {
      var fonudCat = categories2.where((element) => item == element.id);
      if (fonudCat.isNotEmpty) {
        catArray.add(fonudCat.first.name);
      }
    }
    return SizesModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      cat: json['cat'],
      hide: json['hide'],
      categories: catArray,
      img: json['img'],
    );
  }
}

@JsonSerializable()
class SizesResponseModel {
  final bool success;
  final List<SizesModel> data;
  final List<CategoryModel> categories;
  SizesResponseModel({
    required this.success,
    required this.data,
    required this.categories,
  });
  factory SizesResponseModel.fromJson(Map<String, dynamic> json) {
    var entry2 = <CategoryModel>[];
    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        entry2.add(CategoryModel.fromJson(v));
      });
    }
    var entry = <SizesModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(SizesModel.fromJson(v, entry2));
      });
    }
    return SizesResponseModel(
        success: json['success'], data: entry, categories: entry2);
  }
}
