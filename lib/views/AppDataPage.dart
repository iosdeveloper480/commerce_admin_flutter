import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class AppDataPage extends StatefulWidget {
  const AppDataPage({Key? key}) : super(key: key);

  @override
  State<AppDataPage> createState() => _AppDataPageState();
}

class _AppDataPageState extends State<AppDataPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('App Data'),
      body: Text('App Data Page'),
    );
  }
}
