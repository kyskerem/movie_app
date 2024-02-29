import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

final class GetPopularMovies {
  final MovieRepository movieRepository;
  GetPopularMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getPopularMovies();
  }
}
