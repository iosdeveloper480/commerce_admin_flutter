import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);

class SliderCell extends StatefulWidget {
  const SliderCell({
    Key? key,
    required this.slider,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);
  final FallbackFunction<SliderModel> onTapEdit;
  final FallbackFunction<SliderModel> onTapDelete;
  final SliderModel slider;

  @override
  State<SliderCell> createState() => _SliderCellState();
}

class _SliderCellState extends State<SliderCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.yellow,
      elevation: 3,
      child: Column(
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
              width: double.infinity,
              height: 180,
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.slider.img ?? ''),
                placeholder: const AssetImage('images/logo.png'),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            // color: CustomColors.shadow,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${widget.slider.name}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                    Text(
                      'Name Ar: ${widget.slider.nameAr}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      child: WAButton(
                        title: 'Edit',
                        onPressed: () {
                          widget.onTapEdit(widget.slider);
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
                          widget.onTapDelete(widget.slider);
                        },
                        backgroundColor: CustomColors.primary,
                        borderRadius: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
