import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class AppAlertsPage extends StatefulWidget {
  const AppAlertsPage({Key? key}) : super(key: key);

  @override
  State<AppAlertsPage> createState() => _AppAlertsPageState();
}

class _AppAlertsPageState extends State<AppAlertsPage> {
  late List<SliderModel> slidersList = [];
  String buttonTitle = 'Add App Alert';

  @override
  void initState() {
    super.initState();
    loadData('app_alerts');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            slidersList =
                SliderResponseModel.forAppAlerts(json.decode(value)).data;
          })
        });
  }

  onTapEdit(SliderModel slider) {
    print(slider.id);
  }

  onTapDelete(SliderModel slider) {
    print(slider.id);
  }

  onPressAddSlider() {}
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: Text('App Alerts'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: slidersList.length,
              itemBuilder: (BuildContext context, int index) {
                return SliderCell(
                  slider: slidersList[index],
                  onTapEdit: onTapEdit,
                  onTapDelete: onTapDelete,
                );
              },
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
                onPressed: onPressAddSlider,
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
