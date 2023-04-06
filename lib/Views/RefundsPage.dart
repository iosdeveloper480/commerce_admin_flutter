import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class RefundsPage extends StatefulWidget {
  const RefundsPage({Key? key}) : super(key: key);

  @override
  State<RefundsPage> createState() => _RefundsPageState();
}

class _RefundsPageState extends State<RefundsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Refund'),
      body: Text('Refunds Page'),
    );
  }
}
