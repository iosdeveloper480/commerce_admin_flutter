import 'dart:convert';

import 'package:fatima_admin/Cells/OrderCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/OrderModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class AcceptedOrdersPage extends StatefulWidget {
  const AcceptedOrdersPage({Key? key}) : super(key: key);

  @override
  State<AcceptedOrdersPage> createState() => _AcceptedOrdersPageState();
}

class _AcceptedOrdersPageState extends State<AcceptedOrdersPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<OrderModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = OrderResponseModel.forAcceptedOrders(json.decode(data)).data;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Accpeted Oerders'),
      body: WAListFutureBuilder<List<OrderModel>>(
        future: getData('orders'),
        itemBuilder: (context1, snapshot, item) {
          return OrderCell(orderModel: item as OrderModel);
        },
      ),
    );
  }
}
