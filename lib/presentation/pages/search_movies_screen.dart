import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_events.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:movie_app/presentation/widgets/movie_list.dart';

final class SearchMoviesScreen extends StatelessWidget {
  const SearchMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _SearchAppBar(
        context: context,
      ),
      body: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
        builder: (context, state) {
          if (state is SearchMoviesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is SearchMoviesLoaded) {
            if (state.movies.isNotEmpty) {
              return MoviesList(movies: state.movies);
            }
            return const Center(
              child: Text('No Movie Found.'),
            );
          }
          if (state is SearchMoviesError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}

class _SearchAppBar extends AppBar {
  _SearchAppBar({
    super.key,
    required BuildContext context,
  }) : super(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Form(
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Movie name',
              ),
              onSubmitted: (query) => context.read<SearchMoviesBloc>().add(
                    FetchSearchMovies(query),
                  ),
            ),
          ),
        );
}
