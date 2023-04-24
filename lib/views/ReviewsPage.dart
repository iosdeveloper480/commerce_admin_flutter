import 'dart:convert';

import 'package:fatima_admin/Cells/ReviewCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:fatima_admin/domain/models/ReviewModel.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late List<NotificationModel> reviewsList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<NotificationModel>> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    var data = await JSONLoader().loadJsonData('reviews');
    var list = ReviewResponseModel.fromJson(json.decode(data)).data;
    return list;
  }

  onPressedDeleteButton(NotificationModel appDataModel) {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Reviews'),
      body: WAListFutureBuilder<List<NotificationModel>>(
          future: getData(),
          itemBuilder: (context1, snapshot, item) {
            return ReviewCell(
              reviewModel: item as NotificationModel,
              onPressedDeleteButton: onPressedDeleteButton,
            );
          }),
    );
  }
}
