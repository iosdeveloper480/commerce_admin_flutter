import 'dart:convert';

import 'package:fatima_admin/Cells/ShopCell.dart';
import 'package:fatima_admin/Components/WABottomButton.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Models/ShopModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/Views/ShopEditPage.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  late List<ShopModel> shopsList = [];
  int selected = 0;
  String buttonTitle = 'Add Size';

  @override
  void initState() {
    super.initState();
    loadData('shops');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            shopsList = ShopsResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  onPressedAddShop() {}
  onPressedEditButton(ShopModel shopModel) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ShopEditPage();
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
