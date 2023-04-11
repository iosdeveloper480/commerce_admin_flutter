import 'package:fatima_admin/Cells/ShopCell.dart';
import 'package:fatima_admin/Components/WABottomButton.dart';
import 'package:fatima_admin/Views/BaseDrawerPage.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  @override
  void initState() {
    super.initState();
  }

  onPressedAddShop() {}

  @override
  Widget build(BuildContext context) {
    return BaseDrawerPage(
      title: const Text('Shops'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ShopCell();
              },
            ),
          ),
          WABottomButton(
            title: 'Add Shop',
            onPressed: onPressedAddShop,
          ),
        ],
      ),
    );
  }
}
