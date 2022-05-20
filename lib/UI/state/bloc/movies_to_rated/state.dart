part of 'bloc.dart';

abstract class MoviesToRatedState extends Equatable {
  const MoviesToRatedState();

  @override
  List<Object> get props => [];
}

class MoviesToRatedLoadingState extends MoviesToRatedState {}

class MoviesToRatedLoadedState extends MoviesToRatedState {
  final List<MoviesViewModel> movies;

  const MoviesToRatedLoadedState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MoviesToRatedErrorState extends MoviesToRatedState {}