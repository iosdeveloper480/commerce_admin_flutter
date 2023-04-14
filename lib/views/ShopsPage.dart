import 'dart:convert';

import 'package:fatima_admin/Cells/ShopCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/ShopModel.dart';
import 'package:fatima_admin/domain/models/SliderModel.dart';
import 'package:fatima_admin/presentation/pages/ShopUpdatePage.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAMapView.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
import 'package:fatima_admin/views/ShopEditPage.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  late List<ShopModel> shopsList = [];
  late List<SliderModel> slidersList = [];
  int selected = 0;
  String buttonTitle = 'Add Size';

  @override
  void initState() {
    super.initState();
    loadData('shops');
    loadSliders('sliders');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            shopsList = ShopsResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  loadSliders(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            slidersList = SliderResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  Iterable<SliderModel> getSliders(String shopId) {
    return slidersList.where(
      (element) => element.shopId == shopId && element.hide != '1',
    );
  }

  onPressedAddShop() {}
  onPressedLocation(ShopModel shopModel) {
    showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: false,
        enableDrag: false,
        useSafeArea: false,
        context: context,
        builder: (BuildContext context) {
          return const FractionallySizedBox(
            heightFactor: 0.9,
            child: WAMapView(),
          );
        });
  }

  onPressedUpdateButton(ShopModel shopModel) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ShopUpdatePage();
        });
  }

  onPressedEditButton(ShopModel shopModel) {
    List<SliderModel> sliders = getSliders(shopModel.id).toList();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ShopEditPage(
            shop: shopModel,
            sliders: sliders.map((e) => e.img ?? '').toList(),
            onPressedLocation: onPressedLocation,
            onPressedUpdate: onPressedUpdateButton,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Shops'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: shopsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ShopCell(
                  shop: shopsList[index],
                  onPressedEditButton: onPressedEditButton,
                );
              },
            ),
          ),
          WABottomButton(
            title: 'Add Shop',
            onPressed: onPressedAddShop,
          ),
        ],
      ),
    );
  }
}
