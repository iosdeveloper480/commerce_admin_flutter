import 'package:fatima_admin/config/CustomColors.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  ImageViewPage({
    Key? key,
    required this.items,
    required this.selectedIndex,
  }) : super(key: key);

  List<String> items;
  int selectedIndex;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  onPressed() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.transparent,
        shadowColor: CustomColors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return InteractiveViewer(
                  minScale: 1,
                  maxScale: 2.0,
                  child: Container(
                    alignment: const Alignment(0, -0.2),
                    padding: const EdgeInsets.all(0),
                    // color: Colors.yellow,
                    width: MediaQuery.of(context).size.width,
                    child: FadeInImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.items[index]),
                      placeholder: const AssetImage('images/logo.png'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
