part of 'bloc.dart';

abstract class MoviesSearchState extends Equatable {
  const MoviesSearchState();

  @override
  List<Object> get props => [];
}

class MoviesSearchLoadingState extends MoviesSearchState {}

class MoviesSearchLoadedState extends MoviesSearchState {
  final List<MoviesViewModel> movies;

  const MoviesSearchLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesSearchErrorState extends MoviesSearchState {}