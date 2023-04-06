import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({Key? key}) : super(key: key);

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Sales Report'),
      body: Text('SalesReport Page'),
    );
  }
}
