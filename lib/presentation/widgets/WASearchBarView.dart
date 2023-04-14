import 'dart:ui';

import 'package:fatima_admin/config/CustomColors.dart';
import 'package:flutter/material.dart';

class WASearchBarView extends StatefulWidget {
  const WASearchBarView({Key? key}) : super(key: key);

  @override
  State<WASearchBarView> createState() => _WASearchBarViewState();
}

class _WASearchBarViewState extends State<WASearchBarView> {
  bool isEditing = false;
  bool isClear = false;

  onTap() {
    setState(() {
      isEditing = true;
    });
  }

  onChangeValue(String value) {
    if (value.isNotEmpty) {
      isClear = true;
    }
  }

  onPressedClear() {
    _usernameController.clear();
    setState(() {
      isClear = false;
    });
  }

  onPressCnacel(BuildContext context) {
    setState(() {
      isEditing = false;
      isClear = false;
      FocusScope.of(context).unfocus();
    });
  }

  var _usernameController = TextEditingController();
  onTapOutside(PointerDownEvent event, BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: CustomColors.white, borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          BackdropFilter(
            blendMode: BlendMode.src,
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              color: CustomColors.white.withOpacity(0.1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _usernameController,
                  onTap: onTap,
                  onChanged: onChangeValue,
                  onTapOutside: (PointerDownEvent event) {
                    onTapOutside(event, context);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 28.0,
                    ),
                    suffixIcon: Visibility(
                      visible: isClear,
                      child: IconButton(
                        onPressed: onPressedClear,
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: CustomColors.primary,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isEditing,
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {
                      onPressCnacel(context);
                    },
                    child: Text('Cancel'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
