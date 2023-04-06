import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SizesPage extends StatefulWidget {
  const SizesPage({Key? key}) : super(key: key);

  @override
  State<SizesPage> createState() => _SizesPageState();
}

class _SizesPageState extends State<SizesPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Sizes'),
      body: Text('Sizes Page'),
    );
  }
}
