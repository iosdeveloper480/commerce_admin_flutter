import 'dart:convert';

import 'package:fatima_admin/Components/WABottomButton.dart';
import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WASegmentedControl.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:fatima_admin/Cells/FeatureCell.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/cupertino.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);
  final String title = 'Features';

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  late List<CategoryModel> categories = [];
  bool isFeatured = true;
  String buttonTitle = 'Add Feature';
  @override
  void initState() {
    super.initState();
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
        isFeatured = true;
        buttonTitle = 'Add Feature';
      } else {
        loadData('sub_categories');
        isFeatured = false;
        buttonTitle = 'Add Feature Option';
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
      title: const Text('Features'),
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
                    'Features',
                    'Options',
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Row Container
                      return FeatureCell(
                        category: categories[index],
                        isFeatured: isFeatured,
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
