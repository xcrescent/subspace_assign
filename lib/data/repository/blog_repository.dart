import 'package:dio/dio.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:subspace_assign/data/repository/blog_repository_interface.dart';

class BlogRepository extends BlogRepositoryInterface {
  @override
  Future<List<Blog>> fetchBlogs() async {
    // Assuming you're using Dio for making HTTP requests
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await Dio().get(
        url,
        options: Options(
          headers: {
            'x-hasura-admin-secret': adminSecret,
          },
        ),
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        print('Response data: ${response.data}');
        final blogs = response.data['blogs'];
        return blogs.map<Blog>((blog) => Blog.fromJson(blog)).toList();
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.data}');
        return [];
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      rethrow;
    }
  }
}
