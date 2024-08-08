import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:subspace_assign/features/home/bloc/blog_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogItemWidget extends StatelessWidget {
  final Blog blog;
  final VoidCallback onTap;

  const BlogItemWidget({super.key, required this.blog, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade900,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            colorBlendMode: BlendMode.darken,
            color: Colors.black.withOpacity(0.3),
            imageUrl: blog.imageUrl,
            width: MediaQuery.of(context).size.width - 32,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(blog.title.length > 30
                    ? '${blog.title.substring(0, 30)}...'
                    : blog.title),
                IconButton(
                  icon: Icon(
                    blog.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: blog.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () =>
                      context.read<BlogBloc>().add(ToggleFavorite(blog)),
                ),
              ],
            ),
          ),
        ],
      ).onInkTap(onTap),
    );
  }
}
