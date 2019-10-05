// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_number_trivia_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltNumberTriviaModel> _$builtNumberTriviaModelSerializer =
    new _$BuiltNumberTriviaModelSerializer();

class _$BuiltNumberTriviaModelSerializer
    implements StructuredSerializer<BuiltNumberTriviaModel> {
  @override
  final Iterable<Type> types = const [
    BuiltNumberTriviaModel,
    _$BuiltNumberTriviaModel
  ];
  @override
  final String wireName = 'BuiltNumberTriviaModel';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BuiltNumberTriviaModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  BuiltNumberTriviaModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltNumberTriviaModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltNumberTriviaModel extends BuiltNumberTriviaModel {
  @override
  final String text;
  @override
  final int number;

  factory _$BuiltNumberTriviaModel(
          [void Function(BuiltNumberTriviaModelBuilder) updates]) =>
      (new BuiltNumberTriviaModelBuilder()..update(updates)).build();

  _$BuiltNumberTriviaModel._({this.text, this.number}) : super._() {
    if (text == null) {
      throw new BuiltValueNullFieldError('BuiltNumberTriviaModel', 'text');
    }
    if (number == null) {
      throw new BuiltValueNullFieldError('BuiltNumberTriviaModel', 'number');
    }
  }

  @override
  BuiltNumberTriviaModel rebuild(
          void Function(BuiltNumberTriviaModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltNumberTriviaModelBuilder toBuilder() =>
      new BuiltNumberTriviaModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltNumberTriviaModel &&
        text == other.text &&
        number == other.number;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltNumberTriviaModel')
          ..add('text', text)
          ..add('number', number))
        .toString();
  }
}

class BuiltNumberTriviaModelBuilder
    implements Builder<BuiltNumberTriviaModel, BuiltNumberTriviaModelBuilder> {
  _$BuiltNumberTriviaModel _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  int _number;
  int get number => _$this._number;
  set number(int number) => _$this._number = number;

  BuiltNumberTriviaModelBuilder();

  BuiltNumberTriviaModelBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _number = _$v.number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltNumberTriviaModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltNumberTriviaModel;
  }

  @override
  void update(void Function(BuiltNumberTriviaModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltNumberTriviaModel build() {
    final _$result =
        _$v ?? new _$BuiltNumberTriviaModel._(text: text, number: number);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
