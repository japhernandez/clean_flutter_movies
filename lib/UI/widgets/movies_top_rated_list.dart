import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/UI/screens/screens.dart';
import 'package:clean_flutter_movies/UI/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesToRatedList extends StatelessWidget {
  const MoviesToRatedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesToRaredBloc(
          RepositoryProvider.of<GetMoviesToRatedRepositoryAdapter>(context))
        ..add(RemoteLoadMoviesToRatedEvent()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Top Rated Movies",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          BlocBuilder<MoviesToRaredBloc, MoviesToRatedState>(
            builder: (context, state) {
              if (state is MoviesToRatedLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is MoviesToRatedLoadedState) {
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
                                builder: (_) => MovieDetail(movie: movie),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 110,
                            height: 160,
                            child: Hero(
                              tag: movie.id!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage(
                                  placeholder: const NetworkImage(
                                      'https://i.stack.imgur.com/GNhxO.png'),
                                  image: NetworkImage(movie.fullPosterImg),
                                  fit: BoxFit.cover,
                                ),
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
