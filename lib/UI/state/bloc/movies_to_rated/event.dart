part of 'bloc.dart';

abstract class MoviesToRatedEvent extends Equatable {
  const MoviesToRatedEvent();

  @override
  List<Object> get props => [];
}

class LoadMoviesToRatedEvent extends MoviesToRatedEvent {}

class RemoteLoadMoviesToRatedEvent extends MoviesToRatedEvent {}