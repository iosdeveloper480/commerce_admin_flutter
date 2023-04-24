import 'dart:convert';

import 'package:fatima_admin/Cells/ShopUserCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:flutter/material.dart';
import 'package:fatima_admin/domain/models/ShopUserModel.dart';

class ShopUsersPage extends StatefulWidget {
  const ShopUsersPage({Key? key}) : super(key: key);

  @override
  State<ShopUsersPage> createState() => _ShopUsersPageState();
}

class _ShopUsersPageState extends State<ShopUsersPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<ShopUserModel>> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData('shop_users');
    var list = ShopUserResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  onPress() {}
  onTapChangePassword(ShopUserModel shopUserModel) {}
  onTapEdit(ShopUserModel shopUserModel) {}
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Shop Users'),
      body: Column(
        children: [
          Expanded(
            child: WAListFutureBuilder<List<ShopUserModel>>(
              future: getData(),
              itemBuilder: (context, index, item) {
                return ShopUserCell(
                  dataModel: item as ShopUserModel,
                  onTapChangePassword: onTapChangePassword,
                  onTapEdit: onTapEdit,
                );
              },
            ),
          ),
          WABottomButton(
            title: 'Add User',
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}
