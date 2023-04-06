import 'dart:ffi';

import 'package:fatima_admin/Components/MySegmentControl.dart';
import 'package:fatima_admin/Components/WAExpandableListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  final String title = 'Categories';
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Categories'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MySegmentControl(),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
