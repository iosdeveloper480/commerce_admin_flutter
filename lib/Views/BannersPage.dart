import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Components/WABottomButton.dart';
import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/Views/ImageViewPage.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  late List<SliderModel> slidersList = [];
  String buttonTitle = 'Add Banner';

  @override
  void initState() {
    super.initState();
    loadData('sliders');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            slidersList =
                SliderResponseModel.fromJson2(json.decode(value)).data;
          })
        });
  }

  onTapEdit(SliderModel slider) {
    print(slider.id);
  }

  onTapDelete(SliderModel slider) {
    print(slider.id);
  }

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

  onPressAddBanner() {}
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Banners'),
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
            onPressed: onPressAddBanner,
          ),
        ],
      ),
    );
  }
}
