import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OrderModel2 {
  final String shopId;
  final String id;
  final String name;
  final String nameAr;
  final String itemId;
  final String custom;
  final String price;
  final String quantity;
  final String ticketId;
  final String userId;
  final String status;
  final String? note;
  final String sizeName;
  final String delivery;
  final String img;
  OrderModel2({
    required this.shopId,
    required this.id,
    required this.name,
    required this.nameAr,
    required this.itemId,
    required this.custom,
    required this.price,
    required this.quantity,
    required this.ticketId,
    required this.userId,
    required this.status,
    required this.note,
    required this.sizeName,
    required this.delivery,
    required this.img,
  });
  factory OrderModel2.fromJson(Map<String, dynamic> json) {
    return OrderModel2(
      shopId: json['shop_id'],
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      itemId: json['item_id'],
      custom: json['custom'],
      price: json['price'],
      quantity: json['quantity'],
      ticketId: json['ticket_id'],
      userId: json['user_id'],
      status: json['status'],
      note: json['note'],
      sizeName: json['size_name'],
      delivery: json['delivery'],
      img: json['img'],
    );
  }
}

@JsonSerializable()
class OrderModel {
  final String id;
  final String shopId;
  final String userId;
  final String ticketId;
  final String itemId;
  final String quantity;
  final String custom;
  final String price;
  final String size;
  final String sizeName;
  final String? note;
  final String comm;
  final String date;
  final String delivery;
  final String status;
  final String settlement;
  final String name;
  final String phone;
  final String payment;
  final String address;
  final String discount;
  final String coupon;
  final String total;
  final String productName;
  final String productNameAr;
  final String productPrice;

  OrderModel({
    required this.id,
    required this.shopId,
    required this.userId,
    required this.ticketId,
    required this.itemId,
    required this.quantity,
    required this.custom,
    required this.price,
    required this.size,
    required this.sizeName,
    required this.note,
    required this.comm,
    required this.date,
    required this.delivery,
    required this.status,
    required this.settlement,
    required this.name,
    required this.phone,
    required this.payment,
    required this.address,
    required this.discount,
    required this.coupon,
    required this.total,
    required this.productName,
    required this.productNameAr,
    required this.productPrice,
  });
  String getPaymentMethod() {
    if (payment == "0") {
      return "Cash on Delivery";
    }
    return "Credit Card";
  }

  double getTotal() {
    var total1 = double.parse(total);
    var dis = double.parse(discount);
    var del = double.parse(delivery);
    return (total1 - dis) + del;
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    // json.forEach((key, value) {
    //   if (value == null) {
    //     print('$key is null');
    //   }
    // });
    return OrderModel(
      id: json['id'],
      shopId: json['shop_id'],
      userId: json['user_id'],
      ticketId: json['ticket_id'],
      itemId: json['item_id'],
      quantity: json['quantity'],
      custom: json['custom'],
      price: json['price'],
      size: json['size'],
      sizeName: json['size_name'],
      note: json['note'],
      comm: json['comm'],
      date: json['date'],
      delivery: json['delivery'],
      status: json['status'],
      settlement: json['settlement'],
      name: json['name'],
      phone: json['phone'],
      payment: json['payment'],
      address: json['address'],
      discount: json['discount'],
      coupon: json['coupon'],
      total: json['total'],
      productName: json['product_name'],
      productNameAr: json['product_name_ar'],
      productPrice: json['product_price'],
    );
  }
}

@JsonSerializable()
class OrderResponseModel {
  final bool success;
  final List<OrderModel> data;
  OrderResponseModel({
    required this.success,
    required this.data,
  }) {
    data.sort((a, b) => b.ticketId.compareTo(a.ticketId));
  }
  factory OrderResponseModel.forNewOrders(Map<String, dynamic> json) {
    var entry = <OrderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['status'] == '0') {
          entry.add(OrderModel.fromJson(v));
        }
      });
    }
    return OrderResponseModel(success: json['success'], data: entry);
  }
  factory OrderResponseModel.forAcceptedOrders(Map<String, dynamic> json) {
    var entry = <OrderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['status'] == '1') {
          entry.add(OrderModel.fromJson(v));
        }
      });
    }
    return OrderResponseModel(success: json['success'], data: entry);
  }
  factory OrderResponseModel.forReadyForDeliveryOrders(
      Map<String, dynamic> json) {
    var entry = <OrderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['status'] == '2') {
          entry.add(OrderModel.fromJson(v));
        }
      });
    }
    return OrderResponseModel(success: json['success'], data: entry);
  }
  factory OrderResponseModel.forDeliveryOrders(Map<String, dynamic> json) {
    var entry = <OrderModel>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        if (v['status'] == '3') {
          entry.add(OrderModel.fromJson(v));
        }
      });
    }
    return OrderResponseModel(success: json['success'], data: entry);
  }
}
