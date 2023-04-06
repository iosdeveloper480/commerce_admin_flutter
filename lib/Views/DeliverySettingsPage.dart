import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class DeliverySettingsPage extends StatefulWidget {
  const DeliverySettingsPage({Key? key}) : super(key: key);

  @override
  State<DeliverySettingsPage> createState() => _DeliverySettingsPageState();
}

class _DeliverySettingsPageState extends State<DeliverySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Delivery Settings'),
      body: Text('Delivery Settings Page'),
    );
  }
}
