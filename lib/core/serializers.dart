import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_app/features/nuber_trivia/data/models/built_number_trivia_model.dart';
import 'package:flutter_app/model/built_post.dart';

part 'serializers.g.dart';

@SerializersFor(const [BuiltPost, BuiltNumberTriviaModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
