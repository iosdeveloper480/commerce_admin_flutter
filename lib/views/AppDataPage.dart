import 'dart:convert';

import 'package:fatima_admin/Cells/AppDataCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/AppDataModel.dart';
import 'package:fatima_admin/domain/models/CouponModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class AppDataPage extends StatefulWidget {
  const AppDataPage({Key? key}) : super(key: key);

  @override
  State<AppDataPage> createState() => _AppDataPageState();
}

class _AppDataPageState extends State<AppDataPage> {
  late List<AppDataModel> couponsList = [];

  @override
  void initState() {
    super.initState();
    loadData('app_data');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then(
          (value) => {
            setState(
              () {
                couponsList =
                    AppDataResponseModel.fromJson(json.decode(value)).data;
              },
            )
          },
        );
  }

  onPressedEditButton(AppDataModel appDataModel) {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Coupons'),
      body: WAListView(
        itemCount: couponsList.length,
        itemBuilder: (BuildContext context, int index) {
          return AppDataCell(
            couponModel: couponsList[index],
            onPressedEditButton: onPressedEditButton,
          );
        },
      ),
    );
  }
}
