import 'package:flutter/material.dart';

class WATitleSubtitleRow extends StatefulWidget {
  const WATitleSubtitleRow({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<WATitleSubtitleRow> createState() => _WATitleSubtitleRowState();
}

class _WATitleSubtitleRowState extends State<WATitleSubtitleRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.subtitle,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
