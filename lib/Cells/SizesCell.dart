import 'package:fatima_admin/domain/models/SizesModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATagListView.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

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
    return WACardView(
      innerMargin: const EdgeInsets.all(8),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(4),
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
