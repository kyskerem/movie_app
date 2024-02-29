// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

final class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [id, title, overview, posterPath];
}
