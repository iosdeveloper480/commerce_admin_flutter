import 'package:flutter/material.dart';

class WARow extends StatefulWidget {
  const WARow({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  State<WARow> createState() => _WARowState();
}

class _WARowState extends State<WARow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widget.children,
    );
  }
}
