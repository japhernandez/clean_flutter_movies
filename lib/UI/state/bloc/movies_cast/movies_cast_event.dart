part of 'movies_cast_bloc.dart';

abstract class MoviesCastEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMoviesCastEvent extends MoviesCastEvent {}

class RemoteLoadMoviesCastEvent extends MoviesCastEvent {
  final String id;
  RemoteLoadMoviesCastEvent({required this.id});
  @override
  List<Object> get props => [id];
}
