import 'package:fatima_admin/domain/models/AddressModel.dart';
import 'package:fatima_admin/domain/models/CustomerModel.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/WAConstants.dart';

import 'package:flutter/material.dart';

class AddressCell extends StatefulWidget {
  const AddressCell({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final AddressModel dataModel;

  @override
  State<AddressCell> createState() => _AddressCellState();
}

class _AddressCellState extends State<AddressCell> {
  @override
  Widget build(BuildContext context) {
    return WACardView(
      innerMargin: const EdgeInsets.all(8),
      body: Column(
        children: [
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'User name',
            subtitle: widget.dataModel.name,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Name',
            subtitle: widget.dataModel.name,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Phone',
            subtitle: widget.dataModel.phone,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Country',
            subtitle: widget.dataModel.country,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'City',
            subtitle: widget.dataModel.city,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Flat',
            subtitle: widget.dataModel.flat,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Details',
            subtitle: widget.dataModel.details,
          ),
        ],
      ),
    );
  }
}
