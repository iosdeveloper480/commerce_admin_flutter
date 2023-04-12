import 'dart:ui';

import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final Widget title;
  final Widget body;
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0,
              sigmaY: 100.0,
              tileMode: TileMode.mirror,
            ),
            child: Container(
              color: Colors.yellow.withOpacity(0.5),
            ),
          ),
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        minimum: const EdgeInsets.all(16.0),
        child: widget.body,
      ),
    );
  }
}
