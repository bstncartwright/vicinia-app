// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'up_message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpMessage> _$upMessageSerializer = new _$UpMessageSerializer();

class _$UpMessageSerializer implements StructuredSerializer<UpMessage> {
  @override
  final Iterable<Type> types = const [UpMessage, _$UpMessage];
  @override
  final String wireName = 'UpMessage';

  @override
  Iterable serialize(Serializers serializers, UpMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(Location)),
    ];

    return result;
  }

  @override
  UpMessage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location)) as Location);
          break;
      }
    }

    return result.build();
  }
}

class _$UpMessage extends UpMessage {
  @override
  final String name;
  @override
  final String text;
  @override
  final String time;
  @override
  final Location location;

  factory _$UpMessage([void Function(UpMessageBuilder) updates]) =>
      (new UpMessageBuilder()..update(updates)).build();

  _$UpMessage._({this.name, this.text, this.time, this.location}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('UpMessage', 'name');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('UpMessage', 'text');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('UpMessage', 'time');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('UpMessage', 'location');
    }
  }

  @override
  UpMessage rebuild(void Function(UpMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpMessageBuilder toBuilder() => new UpMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpMessage &&
        name == other.name &&
        text == other.text &&
        time == other.time &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), text.hashCode), time.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpMessage')
          ..add('name', name)
          ..add('text', text)
          ..add('time', time)
          ..add('location', location))
        .toString();
  }
}

class UpMessageBuilder implements Builder<UpMessage, UpMessageBuilder> {
  _$UpMessage _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  LocationBuilder _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder location) => _$this._location = location;

  UpMessageBuilder();

  UpMessageBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _text = _$v.text;
      _time = _$v.time;
      _location = _$v.location?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpMessage;
  }

  @override
  void update(void Function(UpMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpMessage build() {
    _$UpMessage _$result;
    try {
      _$result = _$v ??
          new _$UpMessage._(
              name: name, text: text, time: time, location: location.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UpMessage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
