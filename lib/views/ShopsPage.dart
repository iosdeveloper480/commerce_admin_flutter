import 'dart:convert';

import 'package:fatima_admin/Cells/ShopCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/ShopModel.dart';
import 'package:fatima_admin/domain/models/SliderModel.dart';
import 'package:fatima_admin/presentation/pages/ShopEditShopPage.dart';
import 'package:fatima_admin/presentation/pages/ShopUpdatePage.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
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
    // loadData('shops');
    loadSliders('sliders');
  }

  // loadData(String fileName) {
  //   JSONLoader().loadJsonData(fileName).then((value) => {
  //         setState(() {
  //           shopsList = ShopsResponseModel.fromJson(json.decode(value)).data;
  //         })
  //       });
  // }

  Future<List<ShopModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = ShopsResponseModel.fromJson(json.decode(data)).data;
    shopsList = list;
    return list;
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

  onPressedEditShopButton(ShopModel shopModel) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return ShopEditShopPage();
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
            onPressedEdit: onPressedEditShopButton,
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
            child: WAListFutureBuilder<List<ShopModel>>(
              future: getData('shops'),
              itemBuilder: (context1, snapshot, item) {
                return ShopCell(
                  shop: item as ShopModel,
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
