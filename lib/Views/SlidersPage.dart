import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  const SlidersPage({Key? key}) : super(key: key);

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Sliders'),
      body: Text('Sliders Page'),
    );
  }
}
