import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:subspace_assign/core/local_storage/blog_storage.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:subspace_assign/data/repository/blog_repository.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository _blogRepository = BlogRepository();
  // If box is already open
  final _blogBox = Hive.box<Blog>('blogBox');
  StreamSubscription? _blogSubscription;

  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogLoading());
      final BlogStorage blogStorage = BlogStorage(_blogBox);
      try {
        final blogs = await _blogRepository.fetchBlogs();
        blogStorage.putAll(values: blogs);
        emit(BlogLoaded(blogs));
      } catch (e) {
        try {
          final blogs = blogStorage.getAll();
          emit(BlogLoaded(blogs));
          print('Fetched blogs from local storage');
          return;
        } catch (e) {
          emit(BlogError('Error fetching blogs: $e'));
        }
        emit(BlogError('Error fetching blogs: $e'));
      }
    });

    on<BlogFetched>((event, emit) {
      emit(BlogLoaded(event.blogs));
    });

    on<ToggleFavorite>((event, emit) {
      print('Toggling favorite for blog: ${event.blog.id}');
      if (state is BlogLoaded) {
        final updatedBlogs = (state as BlogLoaded).blogs.map((blog) {
          return blog.id == event.blog.id
              ? blog.copyWith(isFavorite: !blog.isFavorite)
              : blog;
        }).toList();
        final blogStorage = BlogStorage(_blogBox);
        blogStorage.putAll(values: updatedBlogs);
        emit(BlogLoaded(updatedBlogs));
      }
    });
  }

  @override
  Future<void> close() {
    _blogSubscription?.cancel();
    return super.close();
  }
}
