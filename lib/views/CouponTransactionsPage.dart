import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class CouponTransactionsPage extends StatefulWidget {
  const CouponTransactionsPage({Key? key}) : super(key: key);

  @override
  State<CouponTransactionsPage> createState() => _CouponTransactionsPageState();
}

class _CouponTransactionsPageState extends State<CouponTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Coupon Transactions'),
      body: Text('Coupon Transactions Page'),
    );
  }
}
