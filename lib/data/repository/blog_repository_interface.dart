import 'package:subspace_assign/data/models/blog_model.dart';

/// The interface for an API that provides access to a list of blogs.
abstract class BlogRepositoryInterface {
  const BlogRepositoryInterface();
  Future<List<Blog>> fetchBlogs();
}
