import 'package:fatima_admin/Components/WACardView.dart';
import 'package:fatima_admin/Components/WAIconButton.dart';
import 'package:fatima_admin/Components/WAImageView.dart';
import 'package:fatima_admin/Components/WANetworkImageView.dart';
import 'package:fatima_admin/Components/WATitleSubtitleRow.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:fatima_admin/Helpers/WAConstants.dart';
import 'package:fatima_admin/Models/ShopModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCell extends StatefulWidget {
  const ShopCell({
    Key? key,
    required this.shop,
    this.onPressedEditButton,
  }) : super(key: key);

  final ShopModel shop;
  final FallbackFunction<ShopModel>? onPressedEditButton;

  @override
  State<ShopCell> createState() => _ShopCellState();
}

class _ShopCellState extends State<ShopCell> {
  bool isOn = false;
  onChangedSwitch(bool on) {
    setState(() {
      isOn = on;
    });
  }

  @override
  Widget build(BuildContext context) {
    //this comment is only for testing the git push from android studio
    return WACardView(
      innerMargin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 8),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: WANetworkImageView(imageUrl: widget.shop.img ?? ''),
                  // WANetworkImageView(
                  //     imageUrl:
                  //         'http://172.20.30.149/fatima/admin/shops/images/1.png?t=1680067932'),
                ),
                // const WAImageView(
                //     size: Size(double.infinity, 150),
                //     link:
                //         'http://172.20.30.149/fatima/admin/shops/images/1.png?t=1680067932'),
                Container(
                  color: Colors.transparent,
                  width: 35,
                  height: 35,
                  child: WAIconButton(
                    onPressed: () {
                      if (widget.onPressedEditButton != null) {
                        widget.onPressedEditButton!(widget.shop);
                      }
                    },
                    tintColor: CustomColors.primary,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WATitleSubtitleRow(
                      title: 'Name:- ',
                      subtitle: widget.shop.name,
                    ),
                    WATitleSubtitleRow(
                      title: 'Open:- ',
                      subtitle: widget.shop.close == '1' ? 'No' : 'Yes',
                    ),
                  ],
                ),
                WATitleSubtitleRow(
                  title: 'Name Ar:- ',
                  subtitle: widget.shop.nameAr,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: WATitleSubtitleRow(
                        title: 'Email:- ',
                        subtitle: widget.shop.email,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: WATitleSubtitleRow(
                        title: 'Phone:- ',
                        subtitle: widget.shop.phone,
                      ),
                    ),
                  ],
                ),
                WATitleSubtitleRow(
                  title: 'Address:- ',
                  subtitle: widget.shop.address,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WATitleSubtitleRow(
                      title: 'City:- ',
                      subtitle: widget.shop.city,
                    ),
                    WATitleSubtitleRow(
                      title: 'Country:- ',
                      subtitle: widget.shop.country,
                    ),
                  ],
                ),
                WATitleSubtitleRow(
                  title: 'Expiry:- ',
                  subtitle: widget.shop.expiry,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
