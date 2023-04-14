import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/presentation/widgets/WAIconButton.dart';
import 'package:flutter/material.dart';

class WATopView extends StatefulWidget {
  const WATopView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<WATopView> createState() => _WATopViewState();
}

class _WATopViewState extends State<WATopView> {
  onPress(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      color: CustomColors.primary,
      child: Row(
        children: [
          WAIconButton(
              onPressed: () {
                onPress(context);
              },
              icon: Icon(
                Icons.close,
                color: CustomColors.white,
              )),
          Expanded(
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(color: CustomColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
