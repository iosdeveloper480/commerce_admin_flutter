import 'package:fatima_admin/Components/WAButton.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';

class WABottomButton extends StatefulWidget {
  const WABottomButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  State<WABottomButton> createState() => _WABottomButtonState();
}

class _WABottomButtonState extends State<WABottomButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(1),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              clipBehavior: Clip.hardEdge,
              child: WAButton(
                title: widget.title,
                onPressed: widget.onPressed,
                backgroundColor: CustomColors.primary,
                textColor: CustomColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
