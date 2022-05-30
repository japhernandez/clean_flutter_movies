part of 'movies_cast_bloc.dart';

abstract class MoviesCastState extends Equatable {
  const MoviesCastState();

  @override
  List<Object> get props => [];
}

class MoviesCastLoadingState extends MoviesCastState {}

class MoviesCastLoadedState extends MoviesCastState {
  final List<CastViewModel> casts;

  const MoviesCastLoadedState({required this.casts});

  @override
  List<Object> get props => [casts];
}

class MoviesCastErrorState extends MoviesCastState {}
