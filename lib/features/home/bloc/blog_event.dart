part of 'blog_bloc.dart';

@immutable
abstract class BlogEvent {}

class FetchBlogs extends BlogEvent {}

class BlogFetched extends BlogEvent {
  final List<Blog> blogs;
  BlogFetched(this.blogs);
}

class ToggleFavorite extends BlogEvent {
  final Blog blog;
  ToggleFavorite(this.blog);
}
