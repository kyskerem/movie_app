import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });
  final tMoviesList = [
    const Movie(
        id: 1, title: 'title', overview: 'overview', posterPath: '/abc'),
    const Movie(
        id: 2, title: 'abecede', overview: 'it good', posterPath: '/cds')
  ];
  const query = "Doctor Who";
  test(
    'should get the movie from the query',
    () async {
      when(mockMovieRepository.searchMovies(any))
          .thenAnswer((_) async => Right(tMoviesList));

      final result = await usecase(query);
      expect(result, isA<Right<Failure, List<Movie>>>());

      verify(mockMovieRepository.searchMovies(query));
      verifyNoMoreInteractions(mockMovieRepository);
    },
  );
}
