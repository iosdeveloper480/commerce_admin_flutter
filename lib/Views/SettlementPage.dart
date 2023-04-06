import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SettlementPage extends StatefulWidget {
  const SettlementPage({Key? key}) : super(key: key);

  @override
  State<SettlementPage> createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Settlement'),
      body: Text('Settlement Page'),
    );
  }
}
