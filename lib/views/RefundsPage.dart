import 'dart:convert';

import 'package:fatima_admin/Cells/RefundCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/RefundModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class RefundsPage extends StatefulWidget {
  const RefundsPage({Key? key}) : super(key: key);

  @override
  State<RefundsPage> createState() => _RefundsPageState();
}

class _RefundsPageState extends State<RefundsPage> {
  late List<RefundModel> notificationsList = [];

  onPressStatusButton(RefundModel refundModel) {}

  @override
  void initState() {
    super.initState();
  }

  Future<List<RefundModel>> getData() async {
    await Future.delayed(const Duration(milliseconds: 600));
    var data = await JSONLoader().loadJsonData('refunds');
    var list = RefundResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Refunds'),
      body: WAListFutureBuilder<List<RefundModel>>(
        errorMessage: 'No Refund available',
        future: getData(),
        builder: (context1, snapshot) {
          var data = snapshot.data as List<RefundModel>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WAListView(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return RefundCell(
                    dataModel: data[index],
                    onPressStatusButton: onPressStatusButton,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
