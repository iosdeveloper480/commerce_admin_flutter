import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WACardView.dart';
import 'package:fatima_admin/Components/WANetworkImageView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/WAConstants.dart';
import 'package:fatima_admin/Models/SliderModel.dart';
import 'package:flutter/material.dart';

class SliderCell extends StatefulWidget {
  const SliderCell({
    Key? key,
    required this.slider,
    required this.onTapEdit,
    required this.onTapDelete,
    this.onTapImage,
  }) : super(key: key);
  final FallbackFunction<SliderModel> onTapEdit;
  final FallbackFunction<SliderModel> onTapDelete;
  final FallbackFunction<SliderModel>? onTapImage;
  final SliderModel slider;

  @override
  State<SliderCell> createState() => _SliderCellState();
}

class _SliderCellState extends State<SliderCell> {
  @override
  Widget build(BuildContext context) {
    return WACardView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
              width: double.infinity,
              height: 200,
              child: GestureDetector(
                onTap: () {
                  if (widget.onTapImage != null) {
                    widget.onTapImage!(widget.slider);
                  }
                },
                child: WANetworkImageView(imageUrl: widget.slider.img ?? ''),
                // FadeInImage(
                //   fit: BoxFit.cover,
                //   image: NetworkImage(widget.slider.img ?? ''),
                //   placeholder: const AssetImage('images/logo.png'),
                // ),
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
