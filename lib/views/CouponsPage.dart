import 'dart:convert';

import 'package:fatima_admin/Cells/CouponCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/CouponModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  const CouponsPage({Key? key}) : super(key: key);

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  late List<CouponModel> couponsList = [];

  @override
  void initState() {
    super.initState();
    loadData('coupons');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then(
          (value) => {
            setState(
              () {
                couponsList =
                    CouponResponseModel.fromJson(json.decode(value)).data;
              },
            )
          },
        );
  }

  onValueChange(CouponModel couponModel) {
    print('${couponModel.id} is enable/disable now.');
  }

  onPressedAddCoupon() {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Coupons'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WAListView(
            itemCount: couponsList.length,
            itemBuilder: (BuildContext context, int index) {
              return CouponCell(
                couponModel: couponsList[index],
                onValueChange: onValueChange,
              );
            },
          ),
          WABottomButton(
            title: 'Add Coupon',
            onPressed: onPressedAddCoupon,
          ),
        ],
      ),
    );
  }
}
