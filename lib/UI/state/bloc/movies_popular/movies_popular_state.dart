part of 'movies_popular_bloc.dart';

abstract class MoviesPopularState extends Equatable {
  const MoviesPopularState();

  @override
  List<Object> get props => [];
}

class MoviesPopularLoadingState extends MoviesPopularState {}

class MoviesPopularLoadedState extends MoviesPopularState {
  final List<MoviesViewModel> movies;

  const MoviesPopularLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesPopularErrorState extends MoviesPopularState {}