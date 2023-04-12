import 'package:flutter/material.dart';

class WACardView extends StatefulWidget {
  const WACardView({
    Key? key,
    required this.body,
    this.innerMargin = const EdgeInsets.all(0),
    this.cardMargin = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.borderRaius = 4,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final Widget body;
  final EdgeInsets innerMargin;
  final EdgeInsets cardMargin;
  final double borderRaius;
  final Color backgroundColor;

  @override
  State<WACardView> createState() => _WACardViewState();
}

class _WACardViewState extends State<WACardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRaius),
      ),
      margin: widget.cardMargin,
      shadowColor: Colors.yellow,
      elevation: 3,
      child: Container(
        margin: widget.innerMargin,
        child: widget.body,
      ),
    );
  }
}
