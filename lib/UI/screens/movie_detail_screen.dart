import 'package:clean_flutter_movies/UI/helpers/helpers.dart';
import 'package:clean_flutter_movies/UI/widgets/casting_cards.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final MoviesViewModel movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie),
              const SizedBox(height: 20),
              _OverViewCast(movie: movie)
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final MoviesViewModel movie;

  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              movie.title.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          background: FadeInImage(
            placeholder: const AssetImage('assets/images/loading.gif'),
            image: NetworkImage(movie.fullPosterImg),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final MoviesViewModel movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.id!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(movie.fullPosterImg),
                placeholder: const AssetImage('assets/no-image.jpg'),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  movie.originalTitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      color: Colors.grey,
                      Icons.star_outline,
                      size: 15,
                    ),
                    Icon(
                      color: Colors.grey,
                      Icons.star_outline,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final MoviesViewModel movie;

  const _OverView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movie.overview!,
        textAlign: TextAlign.justify,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class _OverViewCast extends StatelessWidget {
  final MoviesViewModel movie;

  const _OverViewCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _OverView(movie: movie),
        CastingCards(castId: movie.id.toString())
      ],
    );
  }
}
