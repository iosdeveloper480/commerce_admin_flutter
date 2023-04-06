import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class MeasurementsPage extends StatefulWidget {
  const MeasurementsPage({Key? key}) : super(key: key);

  @override
  State<MeasurementsPage> createState() => _MeasurementsPageState();
}

class _MeasurementsPageState extends State<MeasurementsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Measurements'),
      body: Text('Measurements Page'),
    );
  }
}
