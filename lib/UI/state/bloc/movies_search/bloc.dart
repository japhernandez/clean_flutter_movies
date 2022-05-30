import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_flutter_movies/UI/helpers/helpers.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';

part 'event.dart';

part 'state.dart';

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  final BaseRepositoryAdapter _baseRepositoryAdapter;

  MoviesSearchBloc(this._baseRepositoryAdapter)
      : super(MoviesSearchLoadingState()) {
    on<RemoteLoadMoviesSearchEvent>(_onRemoteLoadMoviesSearchEvent);
  }

  void _onRemoteLoadMoviesSearchEvent(
      MoviesSearchEvent event, Emitter<MoviesSearchState> emit) async {
    final query = event.props[0] as String;

    final response = await _baseRepositoryAdapter.getMovies(query);
    final movies = response.movies.map(
      (movie) => MoviesViewModel(
        adult: movie.adult,
        backdropPath: movie.backdropPath,
        genreIds: movie.genreIds,
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
      ),
    );
    emit(MoviesSearchLoadedState(movies: movies.toList()));
  }
}
