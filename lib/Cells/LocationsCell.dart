import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Models/CountryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef FallbackFunction<T> = void Function(T item);

class LocationsCell extends StatefulWidget {
  const LocationsCell({
    Key? key,
    required this.country,
    required this.onTapEdit,
    required this.onTapDelete,
    this.isCountry = false,
  }) : super(key: key);
  final FallbackFunction<SizesModel> onTapEdit;
  final FallbackFunction<SizesModel> onTapDelete;
  final SizesModel country;
  final bool isCountry;

  @override
  State<LocationsCell> createState() => _LocationsCellState();
}

class _LocationsCellState extends State<LocationsCell> {
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
                            "Name: ${widget.country.name}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Text(
                            'Name Ar: ${widget.country.nameAr}',
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
                  visible: widget.isCountry,
                  child: Text('Code: ${widget.country.code}'),
                ),
                Visibility(
                  visible: !widget.isCountry,
                  child: Text('Country: ${widget.country.country}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      child: WAButton(
                        title: 'Edit',
                        onPressed: () {
                          widget.onTapEdit(widget.country);
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
                          widget.onTapDelete(widget.country);
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
