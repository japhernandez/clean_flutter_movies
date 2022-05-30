import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_flutter_movies/Infrastructure/driven_adapter/driven_adapter.dart';
import 'package:clean_flutter_movies/UI/state/bloc/movies_cast/movies_cast_bloc.dart';

class CastingCards extends StatelessWidget {
  final String castId;
  const CastingCards({Key? key, required this.castId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoviesCastBloc(
          RepositoryProvider.of<GetMoviesCastRepositoryAdapter>(context))
        ..add(RemoteLoadMoviesCastEvent(id: castId)),
      child: BlocBuilder<MoviesCastBloc, MoviesCastState>(
        builder: (context, state) {
          if (state is MoviesCastLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MoviesCastLoadedState) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.casts.length,
                  itemBuilder: (_, int index) {
                    final itemCard = state.casts[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      height: 100,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  'assets/images/no-image.jpg'),
                              image: NetworkImage(itemCard.fullPosterImg),
                              height: 140,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            itemCard.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
