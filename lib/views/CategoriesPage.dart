import 'dart:convert';

import 'package:fatima_admin/Cells/CategoryCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/CategoryModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/presentation/widgets/WASegmentedControl.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  final String title = 'Categories';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool catSelected = false;
  String buttonTitle = 'Add Category';

  @override
  void initState() {
    super.initState();
    catSelected = true;
  }

  Future<List<CategoryModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = CategoryResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  onCatSelected(int selected) {
    setState(() {
      if (selected == 0) {
        catSelected = true;
        buttonTitle = 'Add Category';
      } else {
        catSelected = false;
        buttonTitle = 'Add Sub Category';
      }
    });
  }

  onTapEdit(CategoryModel category) {
    print(category.id);
  }

  onTapDelete(CategoryModel category) {
    print(category.id);
  }

  onPressed() {}
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Categories'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WASegmentedControl(
                  onPressed: onCatSelected,
                  items: const [
                    'Categories',
                    'Sub Categories',
                  ],
                ),
                Expanded(
                  child: WAListFutureBuilder<List<CategoryModel>>(
                    future: catSelected
                        ? getData('categories')
                        : getData('sub_categories'),
                    itemBuilder: (context1, snapshot, item) {
                      return CategoryCell(
                        isCategory: catSelected,
                        category: item as CategoryModel,
                        onTapEdit: onTapEdit,
                        onTapDelete: onTapDelete,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          WABottomButton(
            title: buttonTitle,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
