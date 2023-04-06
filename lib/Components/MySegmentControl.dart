import 'package:flutter/material.dart';

class MySegmentControl extends StatefulWidget {
  MySegmentControl({super.key});
  @override
  _MySegmentControlState createState() => _MySegmentControlState();
}

class _MySegmentControlState extends State<MySegmentControl> {
  bool catSelected = true;
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
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MySegmentItem(
              title: 'Categories',
              selected: catSelected,
              onPressed: () {
                onPress(true);
              },
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.white,
              indent: 0,
              endIndent: 0,
            ),
            MySegmentItem(
              title: 'Sub Categories',
              selected: !catSelected,
              onPressed: () {
                onPress(false);
              },
            ),
          ],
        ),
      ),
    );
  }

  onPress(bool selected) {
    setState(() {
      catSelected = selected;
    });
  }
}

class MySegmentItem extends StatelessWidget {
  const MySegmentItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
  });
  final String title;
  final bool selected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        splashFactory: NoSplash.splashFactory,
        primary: Colors.transparent,
        onPrimary: Colors.transparent,
        backgroundColor: selected ? Colors.yellow : Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: Colors.transparent),
        ),
      ),
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: Colors.white)),
    ));
  }
}
