import 'dart:convert';

import 'package:fatima_admin/Cells/OrderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/OrderModel.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:flutter/material.dart';

class NewOrdersPage extends StatefulWidget {
  const NewOrdersPage({Key? key}) : super(key: key);

  @override
  State<NewOrdersPage> createState() => _NewOrdersPageState();
}

class _NewOrdersPageState extends State<NewOrdersPage> {
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
                    OrderResponseModel.forNewOrders(json.decode(value)).data;
              },
            )
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('New Oerders'),
      body: WAListView(
        itemCount: ordersList.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderCell(orderModel: ordersList[index]);
        },
      ),
    );
  }
}
