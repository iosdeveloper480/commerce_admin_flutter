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
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        minimum: const EdgeInsets.all(16.0),
        child: widget.body,
      ),
    );
  }
}
