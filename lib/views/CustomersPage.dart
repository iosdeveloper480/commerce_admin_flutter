import 'dart:convert';

import 'package:fatima_admin/Cells/CustomerCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/CustomerModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late List<CustomerModel> notificationsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<CustomerModel>> getData() async {
    await Future.delayed(const Duration(milliseconds: 600));
    var data = await JSONLoader().loadJsonData('customers');
    var list = CustomerResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  onPressedAvailableSizesButton(CustomerModel customerModel) {}

  onPressedValueChange(CustomerModel customerModel) {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Customers'),
      body: WAListFutureBuilder<List<CustomerModel>>(
        errorMessage: 'No Notification available',
        future: getData(),
        itemBuilder: (context1, snapshot, item) {
          return CustomerCell(
            dataModel: item as CustomerModel,
            onPressedSizesButton: onPressedAvailableSizesButton,
            onValueChange: onPressedValueChange,
          );
        },
      ),
    );
  }
}
