import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class NotificationModel {
  final String id;
  final String date;
  final String ticketId;
  final String userName;
  final String productName;
  final String productNameAr;
  final String shopName;
  final String shopNameAr;
  final String img;

  NotificationModel({
    required this.id,
    required this.date,
    required this.ticketId,
    required this.userName,
    required this.productName,
    required this.productNameAr,
    required this.shopName,
    required this.shopNameAr,
    required this.img,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return NotificationModel(
      id: json['id'],
      date: json['date'],
      ticketId: json['ticket_id'],
      userName: json['user_name'],
      productName: json['product_name'],
      productNameAr: json['product_name_ar'],
      shopName: json['shop_name'],
      shopNameAr: json['shop_name_ar'],
      img: json['img'],
    );
  }
}

@JsonSerializable()
class ReviewResponseModel {
  final bool success;
  final List<NotificationModel> data;
  ReviewResponseModel({
    required this.success,
    required this.data,
  });
  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <NotificationModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(NotificationModel.fromJson(v));
      });
    }
    return ReviewResponseModel(success: json['success'], data: entry);
  }
}
