import 'package:flutter/material.dart';
import 'package:movie_app/product/utility/extension/context_extension.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 2,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(.4),
                    child: Image(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicWidth(.3),
                    child: Text(
                      movie.title,
                      style: context.textTheme.headlineSmall,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  movie.overview,
                  style: context.textTheme.labelLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
