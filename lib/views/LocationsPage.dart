import 'dart:convert';

import 'package:fatima_admin/Cells/CategoryCell.dart';
import 'package:fatima_admin/Cells/LocationsCell.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/domain/models/CategoryModel.dart';
import 'package:fatima_admin/domain/models/CountryModel.dart';
import 'package:fatima_admin/presentation/widgets/WABottomButton.dart';
import 'package:fatima_admin/presentation/widgets/WAListFutureBuilder.dart';
import 'package:fatima_admin/presentation/widgets/WAListView.dart';
import 'package:fatima_admin/presentation/widgets/WASegmentedControl.dart';
import 'package:fatima_admin/views/BaseDrawerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);
  final String title = 'Locations';

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  late List<CountryModel> countries = [];
  bool isCountry = true;
  String buttonTitle = 'Add Country';

  @override
  void initState() {
    super.initState();
  }

  Future<List<CountryModel>> getData(String fileName) async {
    await Future.delayed(const Duration(seconds: 1));
    var data = await JSONLoader().loadJsonData(fileName);
    var list = CountryResponseModel.fromJson(json.decode(data)).data;
    countries = list;
    return list;
  }

  onCatSelected(int selected) {
    setState(() {
      if (selected == 0) {
        isCountry = true;
        buttonTitle = 'Add Country';
      } else {
        isCountry = false;
        buttonTitle = 'Add City';
      }
    });
  }

  onTapEdit(CountryModel countryModel) {
    print(countryModel.id);
  }

  onTapDelete(CountryModel countryModel) {
    print(countryModel.id);
  }

  onPressed() {}
  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Locations'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WASegmentedControl(
                  onPressed: onCatSelected,
                  items: const [
                    'Countries',
                    'Cities',
                  ],
                ),
                Expanded(
                  child: WAListFutureBuilder<List<CountryModel>>(
                    future:
                        isCountry ? getData('countries') : getData('cities'),
                    itemBuilder: (BuildContext context2, int index, item) {
                      return LocationsCell(
                        isCountry: isCountry,
                        country: item as CountryModel,
                        onTapEdit: onTapEdit,
                        onTapDelete: onTapDelete,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          WABottomButton(
            title: buttonTitle,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
