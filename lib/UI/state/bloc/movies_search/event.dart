part of 'bloc.dart';

abstract class MoviesSearchEvent extends Equatable {
  const MoviesSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadMoviesSearchEvent extends MoviesSearchEvent {}

class RemoteLoadMoviesSearchEvent extends MoviesSearchEvent {}