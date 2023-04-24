import 'dart:convert';

import 'package:fatima_admin/Cells/SliderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/SliderModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
import 'package:fatima_admin/views/ImageViewPage.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  String buttonTitle = 'Add Banner';

  @override
  void initState() {
    super.initState();
  }

  Future<List<SliderModel>> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData('banners');
    var list = SliderResponseModel.fromJson(json.decode(data)).data;
    return list;
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
            onPressed: onPressAddBanner,
          ),
        ],
      ),
    );
  }
}
