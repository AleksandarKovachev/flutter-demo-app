import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AnimalImage extends Equatable {
  final String url;

  AnimalImage({
    @required this.url,
  });

  @override
  List<Object> get props => [url];
}
