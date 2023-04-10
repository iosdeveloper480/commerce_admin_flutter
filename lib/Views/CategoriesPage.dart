import 'dart:convert';

import 'package:fatima_admin/Cells/CategoryCell.dart';
import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WASegmentedControl.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Helpers/CustomColors.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key? key}) : super(key: key);
  final String title = 'Categories';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late List<CategoryModel> categories = [];
  bool catSelected = false;
  String buttonTitle = 'Add Category';

  @override
  void initState() {
    super.initState();
    catSelected = true;
    loadData('categories');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            categories =
                CategoryResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  onCatSelected(int selected) {
    setState(() {
      if (selected == 0) {
        loadData('categories');
        catSelected = true;
        buttonTitle = 'Add Category';
      } else {
        loadData('sub_categories');
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
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Row Container
                      return CategoryCell(
                        isCategory: catSelected,
                        category: categories[index],
                        onTapEdit: onTapEdit,
                        onTapDelete: onTapDelete,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              clipBehavior: Clip.hardEdge,
              child: WAButton(
                title: buttonTitle,
                onPressed: onPressed,
                backgroundColor: CustomColors.primary,
                textColor: CustomColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
