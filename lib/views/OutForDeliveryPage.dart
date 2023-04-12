import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class OutForDeliveryPage extends StatefulWidget {
  const OutForDeliveryPage({Key? key}) : super(key: key);

  @override
  State<OutForDeliveryPage> createState() => _OutForDeliveryPageState();
}

class _OutForDeliveryPageState extends State<OutForDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Out for Delivery'),
      body: Text('Out for Delivery Page'),
    );
  }
}
