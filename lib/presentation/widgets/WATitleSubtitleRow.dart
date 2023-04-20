import 'package:flutter/material.dart';

class WATitleSubtitleRow extends StatefulWidget {
  const WATitleSubtitleRow({
    Key? key,
    required this.title,
    required this.subtitle,
    this.subtitleMaxLines = 2,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final int subtitleMaxLines;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  State<WATitleSubtitleRow> createState() => _WATitleSubtitleRowState();
}

class _WATitleSubtitleRowState extends State<WATitleSubtitleRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
            flex: 1,
            child: Text(
              widget.subtitle,
              maxLines: widget.subtitleMaxLines,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
