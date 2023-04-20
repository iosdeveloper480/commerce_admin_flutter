import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RefundModel {
  final String id;
  final String userId;
  final String payBy;
  final String date;
  final String ticketId;
  final String itemId;
  final String amount;
  final String? note;
  final String status;
  final String userName;
  final String productName;
  final String productNameAr;
  final String phone;

  RefundModel({
    required this.id,
    required this.userId,
    required this.payBy,
    required this.date,
    required this.ticketId,
    required this.itemId,
    required this.amount,
    required this.note,
    required this.status,
    required this.userName,
    required this.productName,
    required this.productNameAr,
    required this.phone,
  });
  factory RefundModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });
    return RefundModel(
      id: json['id'],
      userId: json['user_id'],
      payBy: json['pay_by'],
      date: json['date'],
      ticketId: json['ticket_id'],
      itemId: json['item_id'],
      amount: json['amount'],
      note: json['note'],
      status: json['status'],
      userName: json['user_name'],
      productName: json['product_name'],
      productNameAr: json['product_name_ar'],
      phone: json['phone'],
    );
  }
  String getStatus() {
    if (status == "0") {
      return 'Waiting';
    }
    return 'Done';
  }

  String getPaidBy() {
    if (payBy == "0") {
      return 'Cash Payment';
    }
    return 'Online Payment';
  }
}

@JsonSerializable()
class RefundResponseModel {
  final bool success;
  final List<RefundModel> data;
  RefundResponseModel({
    required this.success,
    required this.data,
  });
  factory RefundResponseModel.fromJson(Map<String, dynamic> json) {
    var entry = <RefundModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        entry.add(RefundModel.fromJson(v));
      });
    }
    return RefundResponseModel(success: json['success'], data: entry);
  }
}
