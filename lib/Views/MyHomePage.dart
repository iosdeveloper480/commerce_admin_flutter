import 'package:fatima_admin/Components/AppBar.dart';
import 'package:fatima_admin/Components/WAExpandableListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('Home'),
      body: Text('Home Page'),
    );
  }
}
