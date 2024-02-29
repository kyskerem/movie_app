import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

final class SearchMovies {
  final MovieRepository movieRepository;
  SearchMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await movieRepository.searchMovies(query);
  }
}
