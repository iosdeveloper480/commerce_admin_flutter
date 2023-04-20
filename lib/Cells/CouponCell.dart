import 'package:fatima_admin/domain/models/CouponModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/WAConstants.dart';
import 'package:flutter/material.dart';

class CouponCell extends StatefulWidget {
  const CouponCell({
    Key? key,
    required this.couponModel,
    this.onValueChange,
  }) : super(key: key);

  final CouponModel couponModel;
  final FallbackFunction<CouponModel>? onValueChange;

  @override
  State<CouponCell> createState() => _CouponCellState();
}

class _CouponCellState extends State<CouponCell> {
  bool status = false;
  onValueChange(BuildContext context, bool isSelected) {
    setState(() {
      status = isSelected;
      if (widget.onValueChange != null) {
        widget.onValueChange!(widget.couponModel);
      }
    });
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
            subtitle: widget.couponModel.date,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Code',
            subtitle: widget.couponModel.code,
          ),
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
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Value',
            subtitle: widget.couponModel.value,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Used',
            subtitle: widget.couponModel.used,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Max Used',
            subtitle: widget.couponModel.max,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Max Value',
            subtitle: widget.couponModel.cap,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Expiry',
            subtitle: widget.couponModel.expiry,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const VerticalDivider(
                width: 1,
                thickness: 1,
              ),
              Switch(
                value: status,
                onChanged: (bool status) {
                  onValueChange(context, status);
                },
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: const [
                Expanded(
                  child: WAButton(
                    title: 'Edit',
                    onPressed: null,
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                ),
                Expanded(
                  child: WAButton(
                    title: 'Delete',
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
