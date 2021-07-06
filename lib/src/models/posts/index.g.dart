// GENERATED CODE - DO NOT MODIFY BY HAND

part of posts_models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsState> _$postsStateSerializer = new _$PostsStateSerializer();
Serializer<PostInfo> _$postInfoSerializer = new _$PostInfoSerializer();

class _$PostsStateSerializer implements StructuredSerializer<PostsState> {
  @override
  final Iterable<Type> types = const [PostsState, _$PostsState];
  @override
  final String wireName = 'PostsState';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'info',
      serializers.serialize(object.info,
          specifiedType: const FullType(PostInfo)),
    ];

    return result;
  }

  @override
  PostsState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'info':
          result.info.replace(serializers.deserialize(value,
              specifiedType: const FullType(PostInfo)) as PostInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$PostInfoSerializer implements StructuredSerializer<PostInfo> {
  @override
  final Iterable<Type> types = const [PostInfo, _$PostInfo];
  @override
  final String wireName = 'PostInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, PostInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'paths',
      serializers.serialize(object.paths,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AppUser)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.lat != null) {
      result
        ..add('lat')
        ..add(serializers.serialize(object.lat,
            specifiedType: const FullType(double)));
    }
    if (object.lng != null) {
      result
        ..add('lng')
        ..add(serializers.serialize(object.lng,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PostInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'paths':
          result.paths.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AppUser)]))
              as BuiltList<Object>);
          break;
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'lng':
          result.lng = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$PostsState extends PostsState {
  @override
  final PostInfo info;

  factory _$PostsState([void Function(PostsStateBuilder) updates]) =>
      (new PostsStateBuilder()..update(updates)).build();

  _$PostsState._({this.info}) : super._() {
    if (info == null) {
      throw new BuiltValueNullFieldError('PostsState', 'info');
    }
  }

  @override
  PostsState rebuild(void Function(PostsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsStateBuilder toBuilder() => new PostsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsState && info == other.info;
  }

  @override
  int get hashCode {
    return $jf($jc(0, info.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsState')..add('info', info))
        .toString();
  }
}

class PostsStateBuilder implements Builder<PostsState, PostsStateBuilder> {
  _$PostsState _$v;

  PostInfoBuilder _info;
  PostInfoBuilder get info => _$this._info ??= new PostInfoBuilder();
  set info(PostInfoBuilder info) => _$this._info = info;

  PostsStateBuilder();

  PostsStateBuilder get _$this {
    if (_$v != null) {
      _info = _$v.info?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostsState;
  }

  @override
  void update(void Function(PostsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsState build() {
    _$PostsState _$result;
    try {
      _$result = _$v ?? new _$PostsState._(info: info.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'info';
        info.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PostInfo extends PostInfo {
  @override
  final BuiltList<String> paths;
  @override
  final BuiltList<String> tags;
  @override
  final String description;
  @override
  final BuiltList<AppUser> users;
  @override
  final double lat;
  @override
  final double lng;

  factory _$PostInfo([void Function(PostInfoBuilder) updates]) =>
      (new PostInfoBuilder()..update(updates)).build();

  _$PostInfo._(
      {this.paths, this.tags, this.description, this.users, this.lat, this.lng})
      : super._() {
    if (paths == null) {
      throw new BuiltValueNullFieldError('PostInfo', 'paths');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('PostInfo', 'tags');
    }
    if (users == null) {
      throw new BuiltValueNullFieldError('PostInfo', 'users');
    }
  }

  @override
  PostInfo rebuild(void Function(PostInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostInfoBuilder toBuilder() => new PostInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostInfo &&
        paths == other.paths &&
        tags == other.tags &&
        description == other.description &&
        users == other.users &&
        lat == other.lat &&
        lng == other.lng;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, paths.hashCode), tags.hashCode),
                    description.hashCode),
                users.hashCode),
            lat.hashCode),
        lng.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostInfo')
          ..add('paths', paths)
          ..add('tags', tags)
          ..add('description', description)
          ..add('users', users)
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class PostInfoBuilder implements Builder<PostInfo, PostInfoBuilder> {
  _$PostInfo _$v;

  ListBuilder<String> _paths;
  ListBuilder<String> get paths => _$this._paths ??= new ListBuilder<String>();
  set paths(ListBuilder<String> paths) => _$this._paths = paths;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<AppUser> _users;
  ListBuilder<AppUser> get users =>
      _$this._users ??= new ListBuilder<AppUser>();
  set users(ListBuilder<AppUser> users) => _$this._users = users;

  double _lat;
  double get lat => _$this._lat;
  set lat(double lat) => _$this._lat = lat;

  double _lng;
  double get lng => _$this._lng;
  set lng(double lng) => _$this._lng = lng;

  PostInfoBuilder();

  PostInfoBuilder get _$this {
    if (_$v != null) {
      _paths = _$v.paths?.toBuilder();
      _tags = _$v.tags?.toBuilder();
      _description = _$v.description;
      _users = _$v.users?.toBuilder();
      _lat = _$v.lat;
      _lng = _$v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostInfo;
  }

  @override
  void update(void Function(PostInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostInfo build() {
    _$PostInfo _$result;
    try {
      _$result = _$v ??
          new _$PostInfo._(
              paths: paths.build(),
              tags: tags.build(),
              description: description,
              users: users.build(),
              lat: lat,
              lng: lng);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'paths';
        paths.build();
        _$failedField = 'tags';
        tags.build();

        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
