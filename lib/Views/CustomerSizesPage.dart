import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class CustomerSizesPage extends StatefulWidget {
  const CustomerSizesPage({Key? key}) : super(key: key);

  @override
  State<CustomerSizesPage> createState() => _CustomerSizesPageState();
}

class _CustomerSizesPageState extends State<CustomerSizesPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Customer Sizes'),
      body: Text('Customer Sizes Page'),
    );
  }
}
