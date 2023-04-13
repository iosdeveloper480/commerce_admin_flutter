import 'package:flutter/material.dart';

class WACardView extends StatefulWidget {
  const WACardView({
    Key? key,
    required this.body,
    this.innerMargin = const EdgeInsets.all(0),
  }) : super(key: key);

  final Widget body;
  final EdgeInsets innerMargin;

  @override
  State<WACardView> createState() => _WACardViewState();
}

class _WACardViewState extends State<WACardView> {
  @override
  Widget build(BuildContext context) {
    CardTheme theme = Theme.of(context).cardTheme;
    return Card(
      color: theme.color,
      shape: theme.shape,
      margin: theme.margin,
      shadowColor: theme.shadowColor,
      surfaceTintColor: theme.surfaceTintColor,
      elevation: theme.elevation,
      child: Container(
        margin: widget.innerMargin,
        child: widget.body,
      ),
    );
  }
}
