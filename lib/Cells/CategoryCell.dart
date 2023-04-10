import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Models/CategoryModel.dart';
import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);

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
    return Column(
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
        //Divider/Separator
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: double.infinity,
          height: 0.5,
          color: CustomColors.shadow,
        ),
      ],
    );
  }
}
