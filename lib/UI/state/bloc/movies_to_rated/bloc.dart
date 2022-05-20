import 'package:bloc/bloc.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/UI/helpers/helpers.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class MoviesToRaredBloc extends Bloc<MoviesToRatedEvent, MoviesToRatedState> {
  final GetMoviesToRatedRepositoryAdapter getMoviesToRatedRepositoryAdapter;

  MoviesToRaredBloc(this.getMoviesToRatedRepositoryAdapter) : super(MoviesToRatedLoadingState()) {
    on<RemoteLoadMoviesToRatedEvent>((event, emit) async {
      final response = await getMoviesToRatedRepositoryAdapter.getMoviesTopRated();
      final movies = response.movies.map((movie) => MoviesViewModel(
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
      ));
      emit(MoviesToRatedLoadedState(movies: movies.toList()));
    });
  }
}
