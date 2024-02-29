import 'package:get_it/get_it.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

final class DependencyInjection {
  void init() {
    //Bloc
    getIt.registerFactory<PopularMoviesBloc>(
        () => PopularMoviesBloc(getPopularMovies: getIt()));
    getIt.registerFactory<TrendingMoviesBloc>(
        () => TrendingMoviesBloc(getTrendingMovies: getIt()));
    getIt.registerFactory<SearchMoviesBloc>(
        () => SearchMoviesBloc(searchMovies: getIt()));
    //Usecases
    getIt.registerLazySingleton<GetPopularMovies>(
        () => GetPopularMovies(getIt()));
    getIt.registerLazySingleton<GetTrendingMovies>(
        () => GetTrendingMovies(getIt()));
    getIt.registerLazySingleton<SearchMovies>(() => SearchMovies(getIt()));

    //Repositories
    getIt.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(remoteDataSource: getIt()));
    //Data source
    getIt.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(client: getIt()));

    //Http service
    getIt.registerLazySingleton<http.Client>(() => http.Client());
  }
}
