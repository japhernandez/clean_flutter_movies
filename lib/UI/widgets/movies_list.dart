import 'package:clean_flutter_movies/UI/pages/video_detail_page.dart';
import 'package:clean_flutter_movies/UI/state/movies_popular/movies_popular_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Infrastructure/driven_adapter/driven_adapter.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesPopularBloc(
          RepositoryProvider.of<GetMoviesPopularRepositoryAdapter>(context))
        ..add(RemoteLoadMoviesPopularEvent()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Popular on Netflix",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<MoviesPopularBloc, MoviesPopularState>(
            builder: (context, state) {
              if (state is MoviesPopularLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is MoviesPopularLoadedState) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (_, int index) {
                        final movie = state.movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const VideoDetailPage(
                                    videoUrl: "assets/videos/video_1.mp4"),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 110,
                            height: 160,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage(
                                placeholder: const NetworkImage('https://i.stack.imgur.com/GNhxO.png'),
                                image: NetworkImage(movie.fullPosterImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
