import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_flutter_movies/UI/helpers/helpers.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';

part 'movies_popular_event.dart';
part 'movies_popular_state.dart';

class MoviesPopularBloc extends Bloc<MoviesPopularEvent, MoviesPopularState> {
  final GetMoviesPopularRepositoryAdapter getMoviesPopularRepositoryAdapter;

  MoviesPopularBloc(this.getMoviesPopularRepositoryAdapter) : super(MoviesPopularLoadingState()) {
    on<RemoteLoadMoviesPopularEvent>((event, emit) async {
      final response = await getMoviesPopularRepositoryAdapter.getMoviesPopular();
      final movies = response.movies.map((movie) => MoviesViewModel(
        adult: movie.adult,
        backdropPath: movie.backdropPath,
        genreIds: movie.genreIds,
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteCount: movie.voteCount,
      ));
      emit(MoviesPopularLoadedState(movies: movies.toList()));
    });
  }
}
