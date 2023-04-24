import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/domain/Models/CategoryModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WAIconButton.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/presentation/widgets/WATagListView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureCell extends StatefulWidget {
  const FeatureCell({
    Key? key,
    required this.category,
    required this.onTapEdit,
    required this.onTapDelete,
    this.isFeatured = false,
  }) : super(key: key);
  final FallbackFunction<CategoryModel> onTapEdit;
  final FallbackFunction<CategoryModel> onTapDelete;
  final CategoryModel category;
  final bool isFeatured;

  @override
  State<FeatureCell> createState() => _FeatureCellState();
}

class _FeatureCellState extends State<FeatureCell> {
  bool isFilter = false;
  onChanged(bool valueChanged) {
    setState(() {
      isFilter = valueChanged;
    });
  }

  List<String> items = [
    'Abaya',
    'Dresses',
    'Traveler Wear',
  ];

  @override
  Widget build(BuildContext context) {
    return WACardView(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // padding: const EdgeInsets.all(4),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
                  ),
                  width: 90,
                  height: 110,
                  child:
                      WANetworkImageView(imageUrl: widget.category.img ?? ''),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WATitleSubtitleRow(
                                  title: 'Name:- ',
                                  subtitle: widget.category.name,
                                ),
                                WATitleSubtitleRow(
                                  title: 'Name Ar:- ',
                                  subtitle: widget.category.nameAr,
                                ),
                              ],
                            ),
                          ),
                          CupertinoSwitch(
                            value: isFilter,
                            onChanged: onChanged,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: widget.isFeatured,
                        child: WATagListView(
                          items: items,
                        ),
                      ),
                      Visibility(
                        visible: !widget.isFeatured,
                        child: const WATitleSubtitleRow(
                          title: 'Features:- ',
                          subtitle: 'widget.category.nameAr',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: WAButton(
                                  title: 'Edit',
                                  onPressed: () {
                                    widget.onTapEdit(widget.category);
                                  },
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                width: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 30,
                                child: WAButton(
                                  title: 'Delete',
                                  onPressed: () {
                                    widget.onTapDelete(widget.category);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: widget.isFeatured,
                            child: Row(
                              children: [
                                WAIconButton(
                                  icon: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  ),
                                  tintColor: CustomColors.white,
                                  onPressed: () {
                                    widget.onTapEdit(widget.category);
                                  },
                                  backgroundColor: CustomColors.blue,
                                  borderRadius: 5,
                                ),
                                const VerticalDivider(
                                  thickness: 1,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                WAIconButton(
                                  icon: const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    widget.onTapDelete(widget.category);
                                  },
                                  backgroundColor: CustomColors.blue,
                                  borderRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
