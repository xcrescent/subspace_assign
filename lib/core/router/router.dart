import 'package:go_router/go_router.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:subspace_assign/features/blog/view/blog_page.dart';
import 'package:subspace_assign/features/home/view/home_page.dart';
import 'package:subspace_assign/features/not_found/view/not_found_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/blog',
        builder: (context, state) {
          String id = state.extra as String;
          return BlogPage(
            id: id,
          );
        }),
    // GoRoute(
    //   path: '*',
    //   builder: (context, state) => const NotFoundPage(),

    // ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
