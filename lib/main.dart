import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/dependency_injection.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_events.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_events.dart';
import 'package:movie_app/presentation/pages/home_screen.dart';

void main() {
  DependencyInjection().init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PopularMoviesBloc>(
      create: (context) =>
          getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
    ),
    BlocProvider<TrendingMoviesBloc>(
        create: (context) =>
            getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies())),
    BlocProvider<SearchMoviesBloc>(
      create: (context) => getIt<SearchMoviesBloc>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
