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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: WAListFutureBuilder<List<NotificationModel>>(
              errorMessage: 'No Notification available',
              future: getData(),
              itemBuilder: (context1, snapshot, item) {
                return NotificationsCell(
                  notificationModel: item as NotificationModel,
                );
              },
            ),
          ),
          WABottomButton(
            title: 'Add Notification',
            onPressed: onPressedAddNotification,
          ),
        ],
      ),
    );
  }
}
