import 'package:fatima_admin/domain/models/CustomerModel.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/WAConstants.dart';

import 'package:flutter/material.dart';

class CustomerCell extends StatefulWidget {
  const CustomerCell({
    Key? key,
    required this.dataModel,
    this.onValueChange,
    this.onPressedSizesButton,
  }) : super(key: key);

  final CustomerModel dataModel;
  final FallbackFunction<CustomerModel>? onValueChange;
  final FallbackFunction<CustomerModel>? onPressedSizesButton;

  @override
  State<CustomerCell> createState() => _CustomerCellState();
}

class _CustomerCellState extends State<CustomerCell> {
  bool status = false;
  onValueChange(BuildContext context, bool isSelected) {
    setState(() {
      status = isSelected;
      if (widget.onValueChange != null) {
        widget.onValueChange!(widget.dataModel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WACardView(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 175,
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            child: WANetworkImageView(imageUrl: widget.dataModel.img ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                  title: 'Email',
                  subtitle: widget.dataModel.email,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Gender',
                  subtitle: widget.dataModel.gender,
                ),
                const Divider(
                  height: 18,
                ),
                SizedBox(
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // const Divider(),
                      SizedBox(
                        width: 35,
                        child: Switch(
                          value: status,
                          onChanged: (bool status) {
                            onValueChange(context, status);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 28,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 28,
                        child: TextButton(
                          style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () {
                            widget.onPressedSizesButton!(widget.dataModel);
                          },
                          child: const Text(''),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Available Sizes',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          // const Divider(),
                          Text(
                            widget.dataModel.availableSizes,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
