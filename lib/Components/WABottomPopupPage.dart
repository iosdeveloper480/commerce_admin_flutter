import 'package:flutter/material.dart';

class WABottomPopupPage extends StatefulWidget {
  const WABottomPopupPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<WABottomPopupPage> createState() => _WABottomPopupPageState();
}

class _WABottomPopupPageState extends State<WABottomPopupPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('data');
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return widget.child;
        // return Container(
        //   height: MediaQuery.of(context).size.height * 0.4,
        //   child: Column(
        //     children: [
        //       ListTile(
        //         leading: Icon(Icons.music_note),
        //         title: Text('Music'),
        //         onTap: () {
        //           // Handle music item tap
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.videocam),
        //         title: Text('Video'),
        //         onTap: () {
        //           // Handle video item tap
        //         },
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.photo),
        //         title: Text('Photo'),
        //         onTap: () {
        //           // Handle photo item tap
        //         },
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
