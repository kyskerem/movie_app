import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:movie_app/presentation/widgets/movie_list.dart';

final class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is PopularMoviesLoaded) {
            return MoviesList(movies: state.movies);
          }
          if (state is PopularMoviesError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
