import 'package:fatima_admin/domain/models/NotificationModel.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';

import 'package:flutter/material.dart';

class NotificationsCell extends StatefulWidget {
  const NotificationsCell({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  final NotificationModel notificationModel;

  @override
  State<NotificationsCell> createState() => _NotificationsCellState();
}

class _NotificationsCellState extends State<NotificationsCell> {
  @override
  Widget build(BuildContext context) {
    return WACardView(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))),
            child: WANetworkImageView(
                imageUrl: widget.notificationModel.img ?? ''),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Wrap(
              children: [
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Date',
                  subtitle: widget.notificationModel.date,
                ),
                const Divider(),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Name (English)',
                  subtitle: widget.notificationModel.shopName,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Name (Arabic)',
                  subtitle: widget.notificationModel.shopNameAr,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Details (English)',
                  subtitle: widget.notificationModel.productName,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Details (Arabic)',
                  subtitle: widget.notificationModel.productNameAr,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
