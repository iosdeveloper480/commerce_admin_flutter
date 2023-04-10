import 'dart:convert';

import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Components/WASegmentedControl.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/JSONLoader.dart';
import 'package:fatima_admin/Cells/LocationsCell.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

import '../Models/CountryModel.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({Key? key}) : super(key: key);
  final String title = 'Locations';

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  late List<SizesModel> countries = [];
  bool isCountry = true;
  String buttonTitle = 'Add Country';

  @override
  void initState() {
    super.initState();
    loadData('countries');
  }

  loadData(String fileName) {
    JSONLoader().loadJsonData(fileName).then((value) => {
          setState(() {
            countries = CountryResponseModel.fromJson(json.decode(value)).data;
          })
        });
  }

  onButtonSelected(int selected) {
    setState(() {
      if (selected == 0) {
        loadData('countries');
        isCountry = true;
        buttonTitle = 'Add Country';
      } else {
        loadData('cities');
        isCountry = false;
        buttonTitle = 'Add City';
      }
    });
  }

  onTapEdit(SizesModel country) {
    print(country.id);
  }

  onTapDelete(SizesModel country) {
    print(country.id);
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
                  onPressed: onButtonSelected,
                  items: const [
                    'Countries',
                    'Cities',
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Row Container
                      return LocationsCell(
                        country: countries[index],
                        isCountry: isCountry,
                        onTapEdit: onTapEdit,
                        onTapDelete: onTapDelete,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              clipBehavior: Clip.hardEdge,
              child: WAButton(
                title: buttonTitle,
                onPressed: onPressed,
                backgroundColor: CustomColors.primary,
                textColor: CustomColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
