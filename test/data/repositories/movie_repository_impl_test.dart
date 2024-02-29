import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/errors/server_exception.dart';
import 'package:movie_app/core/errors/server_failure.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/entities/movie.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repositoryImpl;
  late MockMovieRemoteDataSource dataSource;
  setUp(() {
    dataSource = MockMovieRemoteDataSource();
    repositoryImpl = MovieRepositoryImpl(remoteDataSource: dataSource);
  });
  final tMovieModelsList = [
    MovieModel(id: 1, title: 'title', overview: 'overview', posterPath: '/abc'),
    MovieModel(id: 2, title: 'abecede', overview: 'it good', posterPath: '/cds')
  ];

  const tQuery = "Family Guy";
  test('should get popular movies from remote data source', () async {
    when(dataSource.getPopularMovies())
        .thenAnswer((_) async => tMovieModelsList);
    final result = await repositoryImpl.getPopularMovies();
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(dataSource.getPopularMovies());
  });
  test('should get trending movies from remote data source', () async {
    when(dataSource.getTrendingMovies())
        .thenAnswer((_) async => tMovieModelsList);
    final result = await repositoryImpl.getTrendingMovies();
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(dataSource.getTrendingMovies());
  });
  test('should get searched movie from remote data source', () async {
    when(dataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieModelsList);
    final result = await repositoryImpl.searchMovies(tQuery);
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(dataSource.searchMovies(tQuery));
  });
  test('should return server failure when the call is unsuccesful', () async {
    when(dataSource.getPopularMovies()).thenThrow(ServerException());
    final result = await repositoryImpl.getPopularMovies();
    expect(result, isA<Left<Failure, List<Movie>>>());
    verify(dataSource.getPopularMovies());
  });
}
