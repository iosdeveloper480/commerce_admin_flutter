import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class AppConfigurationPage extends StatefulWidget {
  const AppConfigurationPage({Key? key}) : super(key: key);

  @override
  State<AppConfigurationPage> createState() => _AppConfigurationPageState();
}

class _AppConfigurationPageState extends State<AppConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('App Configuration'),
      body: Text('App Configuration Page'),
    );
  }
}
