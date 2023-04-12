import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class OnlineTransactionsPage extends StatefulWidget {
  const OnlineTransactionsPage({Key? key}) : super(key: key);

  @override
  State<OnlineTransactionsPage> createState() => _OnlineTransactionsPageState();
}

class _OnlineTransactionsPageState extends State<OnlineTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Online Transactions'),
      body: Text('Online Transactions Page'),
    );
  }
}
