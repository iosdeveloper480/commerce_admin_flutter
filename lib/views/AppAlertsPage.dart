import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/SliderModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
import 'package:fatima_admin/views/ImageViewPage.dart';
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
  }

  Future<List<SliderModel>> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData('app_alerts');
    var list = SliderResponseModel.fromJson(json.decode(data)).data;
    return list;
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
            child: WAListFutureBuilder<List<SliderModel>>(
              future: getData(),
              itemBuilder: (BuildContext context, int index, item) {
                return SliderCell(
                  slider: item as SliderModel,
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
