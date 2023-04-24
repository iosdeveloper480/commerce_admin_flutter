import 'dart:convert';

import 'package:fatima_admin/Cells/FeatureCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/Models/CategoryModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/presentation/widgets/WASegmentedControl.dart';
import 'package:flutter/material.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);
  final String title = 'Features';

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  bool isFeatured = true;
  String buttonTitle = 'Add Feature';
  @override
  void initState() {
    super.initState();
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
        isFeatured = true;
        buttonTitle = 'Add Feature';
      } else {
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
          WASegmentedControl(
            onPressed: onCatSelected,
            items: const [
              'Features',
              'Options',
            ],
          ),
          Expanded(
            child: WAListFutureBuilder<List<CategoryModel>>(
                future: isFeatured
                    ? getData('categories')
                    : getData('sub_categories'),
                itemBuilder: (context1, snapshot, item) {
                  return FeatureCell(
                    category: item as CategoryModel,
                    isFeatured: isFeatured,
                    onTapEdit: onTapEdit,
                    onTapDelete: onTapDelete,
                  );
                }),
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
