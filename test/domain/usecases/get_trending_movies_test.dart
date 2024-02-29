import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });
  final tMoviesList = [
    const Movie(
        id: 1, title: 'title', overview: 'overview', posterPath: '/abc'),
    const Movie(
        id: 2, title: 'abecede', overview: 'it good', posterPath: '/cds')
  ];
  test(
    'should get the trending movies from the repo',
    () async {
      when(mockMovieRepository.getTrendingMovies())
          .thenAnswer((_) async => Right(tMoviesList));

      final result = await usecase();
      expect(result, isA<Right<Failure, List<Movie>>>());

      verify(mockMovieRepository.getTrendingMovies());
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
