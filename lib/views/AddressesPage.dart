import 'dart:convert';

import 'package:fatima_admin/Cells/AddressCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/AddressModel.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  late List<AddressModel> notificationsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<AddressModel>> getData() async {
    await Future.delayed(const Duration(milliseconds: 600));
    var data = await JSONLoader().loadJsonData('addresses');
    var list = AddressResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Addresses'),
      body: WAListFutureBuilder<List<AddressModel>>(
        errorMessage: 'No Notification available',
        future: getData(),
        builder: (context1, snapshot) {
          var data = snapshot.data as List<AddressModel>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WAListView(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return AddressCell(
                    dataModel: data[index],
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
