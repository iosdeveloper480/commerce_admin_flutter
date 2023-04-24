import 'package:flutter/material.dart';

class WAListView extends StatelessWidget {
  const WAListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
