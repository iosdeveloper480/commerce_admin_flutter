import 'package:fatima_admin/domain/models/CountryModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

class LocationsCell extends StatefulWidget {
  const LocationsCell({
    Key? key,
    required this.country,
    required this.onTapEdit,
    required this.onTapDelete,
    this.isCountry = false,
  }) : super(key: key);
  final FallbackFunction<CountryModel> onTapEdit;
  final FallbackFunction<CountryModel> onTapDelete;
  final CountryModel country;
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
    return WACardView(
      body: Column(
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
                          WATitleSubtitleRow(
                            title: 'Name:- ',
                            subtitle: widget.country.name,
                          ),
                          WATitleSubtitleRow(
                            title: 'Name Ar:- ',
                            subtitle: widget.country.nameAr,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: widget.isCountry,
                  child: WATitleSubtitleRow(
                    title: 'Code:- ',
                    subtitle: widget.country.code ?? '',
                  ),
                ),
                Visibility(
                  visible: !widget.isCountry,
                  child: WATitleSubtitleRow(
                    title: 'Country:- ',
                    subtitle: widget.country.country ?? '',
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
                          widget.onTapEdit(widget.country);
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
                          widget.onTapDelete(widget.country);
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
