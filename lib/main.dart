import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_flutter_movies/UI/pages/root_app.dart';
import 'package:clean_flutter_movies/Infrastructure/entry_points/entry_points.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => makeGetMoviesPopularFactory()),
        RepositoryProvider(create: (context) => makeGetMoviesToRateFactory())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootApp(),
      ),
    );
  }
}
