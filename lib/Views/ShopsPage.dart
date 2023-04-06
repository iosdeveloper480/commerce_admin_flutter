import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Shops'),
      body: Text('Shops Page'),
    );
  }
}
