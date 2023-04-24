import 'dart:convert';

import 'package:fatima_admin/Cells/SizesCell.dart';
import 'package:fatima_admin/Cells/SizesChartCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/SizesModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/presentation/widgets/WASegmentedControl.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
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
  }

  Future<List<SizesModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = SizesResponseModel.fromJson(json.decode(data)).data;
    sizesList = list;
    return list;
  }

  onButtonSelected(int selected) {
    setState(() {
      this.selected = selected;
      if (selected == 0) {
        buttonTitle = 'Add Size';
      } else if (selected == 1) {
        buttonTitle = 'Add Size Chart';
      } else {
        buttonTitle = 'Add Measurement';
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
                  child: WAListFutureBuilder<List<SizesModel>>(
                      future: selected == 0
                          ? getData('sizes')
                          : (selected == 1
                              ? getData('sizes_chart')
                              : getData('measurements')),
                      itemBuilder: (context1, snapshot, item) {
                        if (selected == 1) {
                          //Row Container
                          return SizesChartCell(
                            sizeChart: item as SizesModel,
                            onTapEdit: onTapEdit,
                            onTapDelete: onTapDelete,
                          );
                        } else {
                          //Row Container
                          return SizesCell(
                            size: item as SizesModel,
                            onTapEdit: onTapEdit,
                            onTapDelete: onTapDelete,
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
          WABottomButton(
            title: buttonTitle,
            onPressed: onPressAddSize,
          ),
        ],
      ),
    );
  }
}
