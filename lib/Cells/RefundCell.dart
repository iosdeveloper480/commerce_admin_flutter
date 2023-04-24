import 'package:fatima_admin/domain/models/RefundModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/Callback.dart';

import 'package:flutter/material.dart';

class RefundCell extends StatefulWidget {
  const RefundCell({
    Key? key,
    required this.dataModel,
    this.onPressStatusButton,
  }) : super(key: key);

  final RefundModel dataModel;
  final FallbackFunction<RefundModel>? onPressStatusButton;

  @override
  State<RefundCell> createState() => _RefundCellState();
}

class _RefundCellState extends State<RefundCell> {
  onPressStatusButton() {
    if (widget.onPressStatusButton != null) {
      widget.onPressStatusButton!(widget.dataModel);
    }
  }

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
            subtitle: widget.dataModel.date,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Ticket',
            subtitle: widget.dataModel.ticketId,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'User Name',
            subtitle: widget.dataModel.userName,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Product',
            subtitle: widget.dataModel.productName,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Phone',
            subtitle: widget.dataModel.phone,
          ),
          const Divider(),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Amount',
            subtitle: widget.dataModel.amount,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Paid By',
            subtitle: widget.dataModel.getPaidBy(),
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Notes',
            subtitle: widget.dataModel.note ?? 'No Notes',
          ),
          SizedBox(
            width: double.infinity,
            child: WAButton(
              title: widget.dataModel.getStatus(),
              onPressed: onPressStatusButton,
            ),
          ),
        ],
      ),
    );
  }
}
