import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WATopView.dart';
import 'package:flutter/material.dart';

class ShopUpdatePage extends StatefulWidget {
  const ShopUpdatePage({Key? key}) : super(key: key);

  @override
  State<ShopUpdatePage> createState() => _ShopUpdatePageState();
}

class _ShopUpdatePageState extends State<ShopUpdatePage> {
  onPressedSave() {}
  onPressedCancel(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          const WATopView(title: 'Update'),
          Container(
            height: 45,
            margin:
                const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: CustomColors.primary,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Commission',
                label: Text('Commission'),
              ),
            ),
          ),
          Container(
            height: 45,
            margin:
                const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: CustomColors.primary,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Expiry',
                label: Text('Expiry'),
              ),
            ),
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: WAButton(
                    title: 'Save',
                    onPressed: onPressedSave,
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: CustomColors.white,
                ),
                Expanded(
                  child: WAButton(
                    title: 'Cancel',
                    onPressed: () {
                      onPressedCancel(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
