import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:subspace_assign/data/models/blog_model.dart';

/// This class used for storing data in nosql hive boxes
/// ,reading data and deleting data .
class BlogStorage {
  Box? blogBox;

  BlogStorage(this.blogBox);

  void init() {
    blogBox = blogBox ??
        Hive.box(
          'blogBox',
        );
  }

  /// for getting value as String for a
  /// given key from the box
  Blog? get({required String key}) {
    return blogBox?.get(key) as Blog?;
  }

  /// for getting value as List<Blog> for a
  List<Blog> getAll() {
    if (blogBox == null) {
      init();
    }
    if (blogBox?.length == 0) {
      return [];
    }
    return blogBox?.values.toList().cast<Blog>() ?? [];
  }

  /// for storing value on defined key
  /// on the box
  Future<void> put({
    required String key,
    required Blog value,
  }) async {
    await blogBox?.put(key, value);
  }

  Future<void> putAll({required List<Blog> values}) async {
    await blogBox?.clear();
    await blogBox?.addAll(values);
    print('All values added');
  }

  

  /// for clearing all data in box
  Future<void> clearAllData() async {
    await blogBox?.clear();
  }
}
