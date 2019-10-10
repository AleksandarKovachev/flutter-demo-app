import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/animal_image/domain/entities/animal_image.dart';

class AnimalImageDisplay extends StatelessWidget {
  final AnimalImage animalImage;

  const AnimalImageDisplay({
    Key key,
    @required this.animalImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: animalImage.url,
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
