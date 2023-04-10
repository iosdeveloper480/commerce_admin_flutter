import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  const SlidersPage({Key? key}) : super(key: key);

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  late List<SliderModel> slidersList = [];
  String buttonTitle = 'Add Slider';

  @override
  void initState() {
    super.initState();
    loadData('sliders');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            slidersList = SliderResponseModel.fromJson(json.decode(value)).data;
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
      title: Text('Sliders'),
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
