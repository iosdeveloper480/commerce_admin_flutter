import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WATextFormField.dart';
import 'package:fatima_admin/presentation/widgets/WATopView.dart';
import 'package:flutter/material.dart';

class ShopEditShopPage extends StatefulWidget {
  const ShopEditShopPage({Key? key}) : super(key: key);

  @override
  State<ShopEditShopPage> createState() => _ShopEditShopPageState();
}

class _ShopEditShopPageState extends State<ShopEditShopPage> {
  onPressedSave() {}
  onPressedCancel(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          const WATopView(title: 'Edit'),
          Container(
            margin:
                const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
            child: Column(
              children: [
                WATextFormField(
                  hintText: 'Name (English)',
                  label: 'Name (English)',
                ),
                WATextFormField(
                  hintText: 'Name (Arabic)',
                  label: 'Name (Arabic)',
                ),
                WATextFormField(
                  hintText: 'Phone',
                  label: 'Phone',
                  keyboardType: TextInputType.phone,
                ),
                WATextFormField(
                  hintText: 'Address',
                  label: 'Address',
                ),
                WATextFormField(
                  hintText: 'Country',
                  label: 'City',
                ),
                WATextFormField(
                  hintText: 'Details (English)',
                  label: 'Details (English)',
                ),
                WATextFormField(
                  hintText: 'Details (Arabic)',
                  label: 'Details (Arabic)',
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      top: 0, right: 10, left: 10, bottom: 10),
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
                ),
              ],
            ),
          ),
        ],
      ),
      // child: Wrap(
      //   children: [
      //     const WATopView(title: 'Update'),
      //     Container(
      //       height: 45,
      //       margin:
      //           const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
      //       child: TextField(
      //         keyboardType: TextInputType.number,
      //         decoration: InputDecoration(
      //           border: OutlineInputBorder(
      //             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      //             borderSide: BorderSide(
      //               color: CustomColors.primary,
      //               width: 1,
      //               style: BorderStyle.solid,
      //             ),
      //           ),
      //           hintText: 'Commission',
      //           label: Text('Commission'),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 45,
      //       margin:
      //           const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
      //       child: TextField(
      //         keyboardType: TextInputType.number,
      //         decoration: InputDecoration(
      //           border: OutlineInputBorder(
      //             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      //             borderSide: BorderSide(
      //               color: CustomColors.primary,
      //               width: 1,
      //               style: BorderStyle.solid,
      //             ),
      //           ),
      //           hintText: 'Expiry',
      //           label: Text('Expiry'),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 45,
      //       width: MediaQuery.of(context).size.width,
      //       margin:
      //           const EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: WAButton(
      //               title: 'Save',
      //               onPressed: onPressedSave,
      //             ),
      //           ),
      //           VerticalDivider(
      //             width: 1,
      //             thickness: 1,
      //             color: CustomColors.white,
      //           ),
      //           Expanded(
      //             child: WAButton(
      //               title: 'Cancel',
      //               onPressed: () {
      //                 onPressedCancel(context);
      //               },
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
