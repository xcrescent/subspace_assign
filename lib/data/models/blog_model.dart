import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

@freezed
class Blog extends HiveObject with _$Blog {
  Blog._();

  @HiveType(typeId: 0)
  factory Blog({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) @JsonKey(name: "image_url") required String imageUrl,
    @HiveField(3) @Default(false) bool isFavorite,
  }) = _Blog;

  /// Convert a JSON object into an [UserModel] instance.
  /// This enables type-safe reading of the API response.
  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
}
