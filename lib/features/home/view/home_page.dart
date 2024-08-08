import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:subspace_assign/features/blog/view/blog_page.dart';
import 'package:subspace_assign/features/home/bloc/blog_bloc.dart';
import 'package:subspace_assign/widgets/blog_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(FetchBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subspace Assign'),
      ),
      body: const BlogListView(),
    );
  }
}

class BlogListView extends StatelessWidget {
  const BlogListView({super.key});

  @override
  Widget build(BuildContext context) {
    final blogBloc = BlocProvider.of<BlogBloc>(context);
    return BlocBuilder<BlogBloc, BlogState>(
      bloc: blogBloc,
      builder: (context, state) {
        if (state is BlogLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BlogLoaded) {
          debugPrint('Blogs loaded: ${state.blogs.length}');
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: state.blogs.length,
            itemBuilder: (context, index) {
              final blog = state.blogs[index];
              return BlogItemWidget(
                blog: blog,
                onTap: () => context.push('/blog', extra: blog.id),
              );
            },
          );
        } else if (state is BlogError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text("Unexpected state"));
        }
      },
    );
  }
}
