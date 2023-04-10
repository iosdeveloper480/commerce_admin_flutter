import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WATagListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Models/SizesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);

class SizesCell extends StatefulWidget {
  const SizesCell({
    Key? key,
    required this.size,
    required this.onTapEdit,
    required this.onTapDelete,
    this.isTagListView = false,
  }) : super(key: key);
  final FallbackFunction<SizesModel> onTapEdit;
  final FallbackFunction<SizesModel> onTapDelete;
  final SizesModel size;
  final bool isTagListView;

  @override
  State<SizesCell> createState() => _SizesCellState();
}

class _SizesCellState extends State<SizesCell> {
  bool isFilter = false;
  onChanged(bool valueChanged) {
    setState(() {
      isFilter = valueChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.yellow,
      elevation: 3,
      child: Column(
        children: [
          Container(
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
                          Text(
                            "Name: ${widget.size.name}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Text(
                            'Name Ar: ${widget.size.nameAr}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !widget.isTagListView,
                  child: WATagListView(
                    items: widget.size.categories,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: WAButton(
                        title: 'Edit',
                        onPressed: () {
                          widget.onTapEdit(widget.size);
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
                          widget.onTapDelete(widget.size);
                        },
                        backgroundColor: CustomColors.primary,
                        borderRadius: 5,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
