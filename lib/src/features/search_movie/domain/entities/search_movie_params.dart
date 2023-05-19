import 'package:equatable/equatable.dart';

class SearchMovieParams extends Equatable {
  SearchMovieParams({required this.queryString});
  final String queryString;

  @override
  List<Object> get props => [queryString];
}
