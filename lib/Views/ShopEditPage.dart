import 'package:flutter/material.dart';

class ShopEditPage extends StatefulWidget {
  const ShopEditPage({Key? key}) : super(key: key);

  @override
  State<ShopEditPage> createState() => _ShopEditPageState();
}

class _ShopEditPageState extends State<ShopEditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () {
                  // Handle music item tap
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
