import 'package:flutter/material.dart';

class WAButton extends StatefulWidget {
  const WAButton({
    super.key,
    required this.title,
    this.ripple = false,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
    this.borderRadius = 0,
    this.shadowColor = Colors.transparent,
    required this.onPressed,
  });

  final String title;
  final bool ripple;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Color shadowColor;

  @override
  State<WAButton> createState() => _WAButtonState();
}

class _WAButtonState extends State<WAButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: widget.backgroundColor,
        shadowColor: widget.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          side: const BorderSide(color: Colors.transparent),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.title, style: TextStyle(color: widget.textColor)),
    );
  }
}
