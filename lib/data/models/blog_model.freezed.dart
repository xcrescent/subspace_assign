// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Blog _$BlogFromJson(Map<String, dynamic> json) {
  return _Blog.fromJson(json);
}

/// @nodoc
mixin _$Blog {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogCopyWith<Blog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogCopyWith<$Res> {
  factory $BlogCopyWith(Blog value, $Res Function(Blog) then) =
      _$BlogCopyWithImpl<$Res, Blog>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) @JsonKey(name: "image_url") String imageUrl,
      @HiveField(3) bool isFavorite});
}

/// @nodoc
class _$BlogCopyWithImpl<$Res, $Val extends Blog>
    implements $BlogCopyWith<$Res> {
  _$BlogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogImplCopyWith<$Res> implements $BlogCopyWith<$Res> {
  factory _$$BlogImplCopyWith(
          _$BlogImpl value, $Res Function(_$BlogImpl) then) =
      __$$BlogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) @JsonKey(name: "image_url") String imageUrl,
      @HiveField(3) bool isFavorite});
}

/// @nodoc
class __$$BlogImplCopyWithImpl<$Res>
    extends _$BlogCopyWithImpl<$Res, _$BlogImpl>
    implements _$$BlogImplCopyWith<$Res> {
  __$$BlogImplCopyWithImpl(_$BlogImpl _value, $Res Function(_$BlogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? isFavorite = null,
  }) {
    return _then(_$BlogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$BlogImpl extends _Blog {
  _$BlogImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) @JsonKey(name: "image_url") required this.imageUrl,
      @HiveField(3) this.isFavorite = false})
      : super._();

  factory _$BlogImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  @JsonKey(name: "image_url")
  final String imageUrl;
  @override
  @JsonKey()
  @HiveField(3)
  final bool isFavorite;

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, imageUrl: $imageUrl, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, imageUrl, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogImplCopyWith<_$BlogImpl> get copyWith =>
      __$$BlogImplCopyWithImpl<_$BlogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogImplToJson(
      this,
    );
  }
}

abstract class _Blog extends Blog {
  factory _Blog(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) @JsonKey(name: "image_url") required final String imageUrl,
      @HiveField(3) final bool isFavorite}) = _$BlogImpl;
  _Blog._() : super._();

  factory _Blog.fromJson(Map<String, dynamic> json) = _$BlogImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @HiveField(3)
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$BlogImplCopyWith<_$BlogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
