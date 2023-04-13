import 'package:flutter/material.dart';

class WAButton extends StatefulWidget {
  const WAButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  State<WAButton> createState() => _WAButtonState();
}

class _WAButtonState extends State<WAButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: widget.onPressed,
      child: Text(widget.title),
    );
  }
}
