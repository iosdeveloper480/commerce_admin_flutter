import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class AcceptedOrdersPage extends StatefulWidget {
  const AcceptedOrdersPage({Key? key}) : super(key: key);

  @override
  State<AcceptedOrdersPage> createState() => _AcceptedOrdersPageState();
}

class _AcceptedOrdersPageState extends State<AcceptedOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Accepted Orders'),
      body: Text('Accepted Orders Page'),
    );
  }
}
