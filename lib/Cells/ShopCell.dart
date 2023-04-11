import 'package:fatima_admin/Components/WACardView.dart';
import 'package:fatima_admin/Components/WAImageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCell extends StatefulWidget {
  const ShopCell({Key? key}) : super(key: key);

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
    return WACardView(
      innerMargin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
      body: Column(
        children: [
          const WAImageView(
              size: Size(double.infinity, 150),
              link:
                  'http://172.20.30.149/fatima/admin/shops/images/1.png?t=1680067932'),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const WATitleSubtitleRow(
                        title: 'Name:- ', subtitle: 'Data'),
                    SizedBox(
                        height: 25,
                        child: CupertinoSwitch(
                            value: isOn, onChanged: onChangedSwitch))
                  ],
                ),
                const WATitleSubtitleRow(title: 'Name Ar:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'Email:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'Phone:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'Address:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'Country:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'City:- ', subtitle: 'Data'),
                const WATitleSubtitleRow(title: 'Expiry:- ', subtitle: 'Data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WATitleSubtitleRow extends StatefulWidget {
  const WATitleSubtitleRow({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<WATitleSubtitleRow> createState() => _WATitleSubtitleRowState();
}

class _WATitleSubtitleRowState extends State<WATitleSubtitleRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(
            widget.subtitle,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
