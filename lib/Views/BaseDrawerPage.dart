import 'dart:ui';

import 'package:fatima_admin/Components/WAExpandableListView.dart';
import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:flutter/material.dart';

class BaseDrawerPage extends StatefulWidget {
  BaseDrawerPage({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final Widget title;
  final Widget body;

  @override
  State<BaseDrawerPage> createState() => _BaseDrawerPageState();
}

class _BaseDrawerPageState extends State<BaseDrawerPage> {
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 500;
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: widget.title,
        backgroundColor: Colors.white,
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
      drawer: Drawer(
        backgroundColor: CustomColors.purple,
        child: ListView.builder(
          itemCount: leftMenuModelList.length,
          itemBuilder: (context, i) {
            return WAExpandableListView(
              leftMenuModel: leftMenuModelList[i],
              index: i,
            );
          },
        ),
      ),
      body: SafeArea(
        // minimum: const EdgeInsets.all(8),
        child: widget.body,
      ),
    );
  }
}
