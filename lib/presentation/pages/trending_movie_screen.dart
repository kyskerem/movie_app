import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:movie_app/presentation/widgets/movie_list.dart';

final class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is TrendingMoviesLoaded) {
            return MoviesList(movies: state.movies);
          }
          if (state is TrendingMoviesError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
