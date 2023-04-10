import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WAIconButton.dart';
import 'package:fatima_admin/Components/WATagListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);

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
    return Card(
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.yellow,
      elevation: 3,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 90,
                  height: 110,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.category.img ?? ''),
                    placeholder: const AssetImage('images/logo.png'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  // color: CustomColors.shadow,
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
                                Text(
                                  "Name: ${widget.category.name}",
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Text(
                                  'Name Ar: ${widget.category.nameAr}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
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
                        child: const Text('Features: alkdjflkajf'),
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
                                  backgroundColor: CustomColors.primary,
                                  borderRadius: 5,
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
                                  backgroundColor: CustomColors.primary,
                                  borderRadius: 5,
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
