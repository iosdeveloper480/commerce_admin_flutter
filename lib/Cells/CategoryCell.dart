import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/domain/models/CategoryModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/utils/WAConstants.dart';
import 'package:flutter/material.dart';

class CategoryCell extends StatefulWidget {
  const CategoryCell({
    Key? key,
    required this.category,
    required this.onTapEdit,
    required this.onTapDelete,
    required this.isCategory,
  }) : super(key: key);
  final FallbackFunction<CategoryModel> onTapEdit;
  final FallbackFunction<CategoryModel> onTapDelete;
  final CategoryModel category;
  final bool isCategory;

  @override
  State<CategoryCell> createState() => _CategoryCellState();
}

class _CategoryCellState extends State<CategoryCell> {
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
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4)),
                ),
                width: 90,
                height: 110,
                child: WANetworkImageView(
                  imageUrl:
                      widget.category.img == null ? '' : widget.category.img!,
                  placeholderImageUrl: 'images/logo.png',
                ),
                // FadeInImage(
                //   fit: BoxFit.cover,
                //   placeholder: const AssetImage('images/logo.png'),
                //   image: NetworkImage(widget.category.img == null
                //       ? ''
                //       : widget.category.img!),
                // ),
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
                      Text(
                        widget.category.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.category.nameAr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Visibility(
                        visible: widget.isCategory,
                        child: Text(
                          widget.category.special != null
                              ? "Special: ${widget.category.special!}"
                              : '',
                          textAlign: TextAlign.left,
                        ),
                      ),
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
