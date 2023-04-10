import 'package:flutter/material.dart';

class WAIconButton extends StatefulWidget {
  const WAIconButton({
    super.key,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.tintColor = Colors.black,
    this.borderRadius = 0,
    this.shadowColor = Colors.transparent,
    required this.onPressed,
    required this.icon,
  });

  final String? title;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color? tintColor;
  final double borderRadius;
  final Color shadowColor;
  final Widget? icon;

  @override
  State<WAIconButton> createState() => _WAIconButtonState();
}

class _WAIconButtonState extends State<WAIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.icon != null) widget.icon!,
            if (widget.title != null)
              Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
