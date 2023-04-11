import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Components/WABottomButton.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/Views/ImageViewPage.dart';
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
  onTapImage(SliderModel slider) {
    List<String> items = [slider.img!];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewPage(items: items, selectedIndex: 0),
        fullscreenDialog: true,
      ),
    );
  }

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
                  onTapImage: onTapImage,
                );
              },
            ),
          ),
          WABottomButton(
            title: buttonTitle,
            onPressed: onPressAddSlider,
          ),
        ],
      ),
    );
  }
}
