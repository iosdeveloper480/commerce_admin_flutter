import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SettlementReportPage extends StatefulWidget {
  const SettlementReportPage({Key? key}) : super(key: key);

  @override
  State<SettlementReportPage> createState() => _SettlementReportPageState();
}

class _SettlementReportPageState extends State<SettlementReportPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Settlement Report'),
      body: Text('SettlementReport Page'),
    );
  }
}
