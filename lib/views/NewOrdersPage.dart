import 'dart:convert';

import 'package:fatima_admin/Cells/OrderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/OrderModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class NewOrdersPage extends StatefulWidget {
  const NewOrdersPage({Key? key}) : super(key: key);

  @override
  State<NewOrdersPage> createState() => _NewOrdersPageState();
}

class _NewOrdersPageState extends State<NewOrdersPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<OrderModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = OrderResponseModel.forNewOrders(json.decode(data)).data;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('New Oerders'),
      body: WAListFutureBuilder<List<OrderModel>>(
        future: getData('orders'),
        itemBuilder: (context1, snapshot, item) {
          return OrderCell(orderModel: item as OrderModel);
        },
      ),
    );
  }
}
