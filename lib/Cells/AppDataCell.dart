import 'package:fatima_admin/domain/models/AppDataModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

class AppDataCell extends StatefulWidget {
  const AppDataCell({
    Key? key,
    required this.couponModel,
    this.onPressedEditButton,
  }) : super(key: key);

  final AppDataModel couponModel;
  final FallbackFunction<AppDataModel>? onPressedEditButton;

  @override
  State<AppDataCell> createState() => _AppDataCellState();
}

class _AppDataCellState extends State<AppDataCell> {
  @override
  Widget build(BuildContext context) {
    return WACardView(
      innerMargin: const EdgeInsets.all(8),
      body: Column(
        children: [
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Name (English)',
            subtitle: widget.couponModel.name,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Name (Arabic)',
            subtitle: widget.couponModel.nameAr,
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details (English)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.couponModel.details,
                maxLines: 5,
              ),
              const Text(
                'Details (Arabic)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.couponModel.detailsAr,
                maxLines: 5,
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: WAButton(
              title: 'Edit',
              onPressed: () {
                if (widget.onPressedEditButton != null) {
                  widget.onPressedEditButton!(widget.couponModel);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
