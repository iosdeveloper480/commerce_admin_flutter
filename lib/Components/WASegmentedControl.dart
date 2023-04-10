import 'package:fatima_admin/Cells/CategoryCell.dart';
import 'package:flutter/material.dart';

class WASegmentedControl extends StatefulWidget {
  final FallbackFunction<int> onPressed;
  final List<String> items;

  const WASegmentedControl(
      {super.key, required this.onPressed, required this.items});

  @override
  _WASegmentedControlState createState() => _WASegmentedControlState();
}

class _WASegmentedControlState extends State<WASegmentedControl> {
  int selectedIndex = 0;
  final List<Widget> _items = [];
  @override
  void initState() {
    super.initState();
    _createItems();
  }

  void _createItems() {
    _items.clear();
    for (int i = 0; i < widget.items.length; i++) {
      if (i == 0 || i == widget.items.length) {
        _items.add(WASegmentedItem(
          title: widget.items[i],
          selected: selectedIndex == i,
          onPressed: () {
            onPress(i);
          },
        ));
      } else {
        _items.add(
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.white,
            indent: 0,
            endIndent: 0,
          ),
        );
        _items.add(WASegmentedItem(
          title: widget.items[i],
          selected: selectedIndex == i,
          onPressed: () {
            onPress(i);
          },
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _items,
        ),
      ),
    );
  }

  onPress(int index) {
    setState(() {
      selectedIndex = index;
      _createItems();
      widget.onPressed(index);
    });
  }
}

class WASegmentedItem extends StatelessWidget {
  const WASegmentedItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
  });
  final String title;
  final bool selected;
  final VoidCallback onPressed;
  final Color backgroundColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: selected ? Colors.yellow : Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(color: selected ? Colors.white : Colors.black)),
      ),
    );
  }
}
