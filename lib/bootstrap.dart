import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:subspace_assign/app.dart';
import 'package:subspace_assign/data/models/blog_model.dart';
import 'package:subspace_assign/features/home/bloc/blog_bloc.dart';
import 'package:subspace_assign/init.dart';

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  unawaited(init());
  await Hive.initFlutter();
  Hive.registerAdapter(BlogImplAdapter());
  await Hive.openBox<Blog>('blogBox');

  runZonedGuarded(
    () => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<BlogBloc>(
            create: (BuildContext context) => BlogBloc(),
          ),
        ],
        child: const App(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
