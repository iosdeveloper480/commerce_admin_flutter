import 'package:fatima_admin/Helpers/WAConstants.dart';
import 'package:flutter/material.dart';

class WAImageView extends StatefulWidget {
  const WAImageView({
    Key? key,
    this.type = ImageType.regular,
    this.onTapImage,
    required this.link,
    this.size = Size.zero,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final ImageType type;
  final FallbackFunction? onTapImage;
  final String link;
  final Size size;
  final Color backgroundColor;

  @override
  State<WAImageView> createState() => _WAImageViewState();
}

class _WAImageViewState extends State<WAImageView> {
  Size size = Size.zero;
  @override
  void initState() {
    super.initState();
    size = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4)),
        ),
        child: GestureDetector(
          onTap: () {
            if (widget.onTapImage != null) {
              widget.onTapImage!(widget.link);
            }
          },
          child: FadeInImage(
            fit: BoxFit.fill,
            image: NetworkImage(widget.link ?? ''),
            placeholder: const AssetImage('images/logo.png'),
          ),
        ),
      ),
    );
  }
}

enum ImageType {
  profile,
  regular,
  full,
  aspectRatio,
  zoomable,
}
