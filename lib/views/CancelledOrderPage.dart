import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class CancelledOrderPage extends StatefulWidget {
  const CancelledOrderPage({Key? key}) : super(key: key);

  @override
  State<CancelledOrderPage> createState() => _CancelledOrderPageState();
}

class _CancelledOrderPageState extends State<CancelledOrderPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Cancelled Order'),
      body: Text('Cancelled Order Page'),
    );
  }
}
