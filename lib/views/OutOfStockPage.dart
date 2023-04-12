import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class OutOfStockPage extends StatefulWidget {
  const OutOfStockPage({Key? key}) : super(key: key);

  @override
  State<OutOfStockPage> createState() => _OutOfStockPageState();
}

class _OutOfStockPageState extends State<OutOfStockPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Out of Stock'),
      body: Text('Out of Stock Page'),
    );
  }
}
