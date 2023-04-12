import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WANetworkImageView.dart';
import 'package:fatima_admin/Components/WATagListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/WAConstants.dart';
import 'package:fatima_admin/Models/SizesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizesChartCell extends StatefulWidget {
  const SizesChartCell({
    Key? key,
    required this.sizeChart,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);
  final FallbackFunction<SizesModel> onTapEdit;
  final FallbackFunction<SizesModel> onTapDelete;
  final SizesModel sizeChart;

  @override
  State<SizesChartCell> createState() => _SizesChartCellState();
}

class _SizesChartCellState extends State<SizesChartCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shadowColor: Colors.yellow,
      elevation: 3,
      child: Row(
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
              child: WANetworkImageView(imageUrl: widget.sizeChart.img ?? ''),
              // FadeInImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(widget.sizeChart.img ?? ''),
              //   placeholder: const AssetImage('images/logo.png'),
              // ),
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
                              "Name: ${widget.sizeChart.name}",
                              textAlign: TextAlign.left,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            Text(
                              'Name Ar: ${widget.sizeChart.nameAr}',
                              textAlign: TextAlign.left,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
