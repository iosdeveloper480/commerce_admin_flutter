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
            blendMode: BlendMode.src,
            filter: ImageFilter.blur(
              sigmaX: 100,
              sigmaY: 100.0,
              tileMode: TileMode.mirror,
            ),
            child: Container(
              color: CustomColors.primary.withOpacity(0.1),
            ),
          ),
        ),
      ),
      drawer: Expanded(
        child: Drawer(
          backgroundColor: CustomColors.purple,
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.cover)),
                child: Text("Header"),
              ),
              Expanded(
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
            ],
          ),
        ),
      ),
      body: SafeArea(
        // minimum: const EdgeInsets.all(8),
        child: widget.body,
      ),
    );
  }
}
