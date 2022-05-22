import 'package:bloc/bloc.dart';
import 'package:clean_flutter_movies/UI/helpers/helpers.dart';
import 'package:equatable/equatable.dart';

import '../../../../Infrastructure/driven_adapter/driven_adapter.dart';

part 'event.dart';

part 'state.dart';

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  final GetMoviesSearchRepositoryAdapter getMoviesSearchRepositoryAdapter;

  MoviesSearchBloc(this.getMoviesSearchRepositoryAdapter)
      : super(MoviesSearchLoadingState()) {
    on<RemoteLoadMoviesSearchEvent>((event, emit) async {
      final response = await getMoviesSearchRepositoryAdapter.getMovieSearch();
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
    });
  }
}
