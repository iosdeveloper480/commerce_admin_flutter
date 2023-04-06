import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Notifications'),
      body: Text('Notifications Page'),
    );
  }
}
