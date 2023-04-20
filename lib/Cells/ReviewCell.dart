import 'package:fatima_admin/domain/models/AppDataModel.dart';
import 'package:fatima_admin/domain/models/ReviewModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/WAConstants.dart';
import 'package:flutter/material.dart';

class ReviewCell extends StatefulWidget {
  const ReviewCell({
    Key? key,
    required this.reviewModel,
    this.onPressedDeleteButton,
  }) : super(key: key);

  final NotificationModel reviewModel;
  final FallbackFunction<NotificationModel>? onPressedDeleteButton;

  @override
  State<ReviewCell> createState() => _ReviewCellState();
}

class _ReviewCellState extends State<ReviewCell> {
  @override
  Widget build(BuildContext context) {
    return WACardView(
      innerMargin: const EdgeInsets.all(8),
      body: Column(
        children: [
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Date',
            subtitle: widget.reviewModel.date,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Ticket',
            subtitle: widget.reviewModel.ticketId,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'User',
            subtitle: widget.reviewModel.userName,
          ),
          const Divider(),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Shop (English)',
            subtitle: widget.reviewModel.shopName,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Shop (Arabic)',
            subtitle: widget.reviewModel.shopNameAr,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Product (English)',
            subtitle: widget.reviewModel.productName,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Product (Arabic)',
            subtitle: widget.reviewModel.productNameAr,
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: WAButton(
              title: 'Delete',
              onPressed: () {
                if (widget.onPressedDeleteButton != null) {
                  widget.onPressedDeleteButton!(widget.reviewModel);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
