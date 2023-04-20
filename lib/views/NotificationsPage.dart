import 'dart:convert';

import 'package:fatima_admin/Cells/NotificationsCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/NotificationModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late List<NotificationModel> notificationsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<NotificationModel>> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData('notifications');
    var list = NotificationResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  onPressedAddNotification() {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Notifications'),
      body: WAListFutureBuilder<List<NotificationModel>>(
        errorMessage: 'No Notification available',
        future: getData(),
        builder: (context1, snapshot) {
          var data = snapshot.data as List<NotificationModel>;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WAListView(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationsCell(
                    notificationModel: data[index],
                  );
                },
              ),
              WABottomButton(
                title: 'Add Notification',
                onPressed: onPressedAddNotification,
              ),
            ],
          );
        },
      ),
    );
  }
}
