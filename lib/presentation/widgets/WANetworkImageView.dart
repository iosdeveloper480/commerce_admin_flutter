import 'package:flutter/material.dart';

class WANetworkImageView extends StatelessWidget {
  final String imageUrl;
  final String placeholderImageUrl;
  final BoxFit? fit;

  const WANetworkImageView({
    Key? key,
    required this.imageUrl,
    this.placeholderImageUrl = 'images/logo.png',
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage(placeholderImageUrl),
      image: NetworkImage(imageUrl),
      fit: fit,
      imageErrorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        // Display error widget
        return Image(
          image: AssetImage(placeholderImageUrl),
        );
      },
      placeholderErrorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        // Display error widget
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error),
            Text('Error loading image'),
          ],
        );
      },
    );
  }
}
