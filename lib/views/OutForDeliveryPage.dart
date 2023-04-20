import 'dart:convert';

import 'package:fatima_admin/Cells/OrderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/OrderModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class OutForDeliveryPage extends StatefulWidget {
  const OutForDeliveryPage({Key? key}) : super(key: key);

  @override
  State<OutForDeliveryPage> createState() => _OutForDeliveryPageState();
}

class _OutForDeliveryPageState extends State<OutForDeliveryPage> {
  late List<OrderModel> ordersList = [];

  @override
  void initState() {
    super.initState();
    loadData('orders');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then(
          (value) => {
            setState(
              () {
                ordersList =
                    OrderResponseModel.forDeliveryOrders(json.decode(value))
                        .data;
              },
            )
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Out for Delivery'),
      body: WAListView(
        itemCount: ordersList.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderCell(orderModel: ordersList[index]);
        },
      ),
    );
  }
}
