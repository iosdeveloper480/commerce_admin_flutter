import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class AppAlertsPage extends StatefulWidget {
  const AppAlertsPage({Key? key}) : super(key: key);

  @override
  State<AppAlertsPage> createState() => _AppAlertsPageState();
}

class _AppAlertsPageState extends State<AppAlertsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('App Alerts'),
      body: Text('App Alerts Page'),
    );
  }
}
