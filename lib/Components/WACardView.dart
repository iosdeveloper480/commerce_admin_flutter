import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:flutter/material.dart';

class WACardView extends StatelessWidget {
  WACardView({Key? key}) : super(key: key);
  // final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: CustomColors.shadow,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Expanded(
        child: Text('Widget 1'),
      ),
    );
  }
}
