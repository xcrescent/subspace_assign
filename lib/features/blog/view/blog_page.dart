import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:subspace_assign/features/home/bloc/blog_bloc.dart';

class BlogPage extends StatelessWidget {
  final String id;

  const BlogPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlogBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        actions: [
          BlocBuilder<BlogBloc, BlogState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is BlogLoading) {
                return const CircularProgressIndicator();
              }
              if (state is BlogError) return const Icon(Icons.error);
              if (state is BlogLoaded) {
                final blog = state.blogs.where((b) => b.id == id).first;
                return IconButton(
                  icon: Icon(
                    blog.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: blog.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<BlogBloc>().add(ToggleFavorite(blog));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is BlogLoading) {
            return const CircularProgressIndicator();
          }
          if (state is BlogError) return const Icon(Icons.error);
          if (state is BlogLoaded) {
            final blog = state.blogs.where((b) => b.id == id).first;
            return BlogDetails(blog: blog);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class BlogDetails extends StatelessWidget {
  final Blog blog;

  const BlogDetails({super.key, required this.blog});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: blog.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            blog.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
