import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Banners'),
      body: Text('Out of Stock Page'),
    );
  }
}
