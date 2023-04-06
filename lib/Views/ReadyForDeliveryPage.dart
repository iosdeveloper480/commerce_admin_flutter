import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class ReadyForDeliveryPage extends StatefulWidget {
  const ReadyForDeliveryPage({Key? key}) : super(key: key);

  @override
  State<ReadyForDeliveryPage> createState() => _ReadyForDeliveryPageState();
}

class _ReadyForDeliveryPageState extends State<ReadyForDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Features'),
      body: Text('Ready For Delivery Page'),
    );
  }
}
