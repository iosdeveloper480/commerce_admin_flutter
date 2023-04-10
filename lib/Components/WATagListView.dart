import 'package:flutter/material.dart';

class WATagListView extends StatefulWidget {
  const WATagListView({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  State<WATagListView> createState() => _WATagListViewState();
}

class _WATagListViewState extends State<WATagListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        spacing: 1,
        runSpacing: 1,
        children: widget.items.map((item) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
