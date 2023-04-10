import 'dart:convert';

import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WASegmentedControl.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Cells/SizesCell.dart';
import 'package:fatima_admin/Models/SizesModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SizesPage extends StatefulWidget {
  const SizesPage({Key? key}) : super(key: key);
  final String title = 'Sizes';

  @override
  State<SizesPage> createState() => _SizesPageState();
}

class _SizesPageState extends State<SizesPage> {
  late List<SizesModel> sizesList = [];
  int selected = 0;
  String buttonTitle = 'Add Size';

  @override
  void initState() {
    super.initState();
    loadData('sizes');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            sizesList = SizesResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  onButtonSelected(int selected) {
    setState(() {
      this.selected = selected;
      if (selected == 0) {
        buttonTitle = 'Add Size';
        loadData('sizes');
      } else if (selected == 1) {
        buttonTitle = 'Add Size Chart';
        loadData('sizes_chart');
      } else {
        buttonTitle = 'Add Measurement';
        loadData('measurements');
      }
    });
  }

  onTapEdit(SizesModel size) {
    print(size.id);
  }

  onTapDelete(SizesModel size) {
    print(size.id);
  }

  onPressAddSize() {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Sizes'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WASegmentedControl(
                  onPressed: onButtonSelected,
                  items: const [
                    'Sizes',
                    'Size Chart',
                    'Measurements',
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: sizesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Row Container
                      return SizesCell(
                        size: sizesList[index],
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
                onPressed: onPressAddSize,
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
