import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SizeChartPage extends StatefulWidget {
  const SizeChartPage({Key? key}) : super(key: key);

  @override
  State<SizeChartPage> createState() => _SizeChartPageState();
}

class _SizeChartPageState extends State<SizeChartPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Size Chart'),
      body: Text('Contacts Page'),
    );
  }
}
