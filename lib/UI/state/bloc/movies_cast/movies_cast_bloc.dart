import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:clean_flutter_movies/Domain/use_cases/contracts/contracts.dart';
import 'package:clean_flutter_movies/UI/helpers/cast_view_model.dart';

part 'movies_cast_event.dart';
part 'movies_cast_state.dart';

class MoviesCastBloc extends Bloc<MoviesCastEvent, MoviesCastState> {
  final GetMoviesCastRepository _getMoviesCastRepository;

  MoviesCastBloc(this._getMoviesCastRepository)
      : super(MoviesCastLoadingState()) {
    on<RemoteLoadMoviesCastEvent>(_onMoviesCastEvent);
  }

  void _onMoviesCastEvent(
      MoviesCastEvent event, Emitter<MoviesCastState> emit) async {
    final response =
        await _getMoviesCastRepository.getMoviesCast(event.props[0]);
    final casts = response.cast!.map((cast) => CastViewModel(
          adult: cast.adult,
          gender: cast.gender,
          id: cast.id,
          knownForDepartment: cast.knownForDepartment,
          name: cast.name,
          originalName: cast.originalName,
          popularity: cast.popularity,
          profilePath: cast.profilePath,
          creditId: cast.creditId,
          department: cast.department,
          job: cast.job,
        ));

    emit(MoviesCastLoadedState(casts: casts.toList()));
  }
}
