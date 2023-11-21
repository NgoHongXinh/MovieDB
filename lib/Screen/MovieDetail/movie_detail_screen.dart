
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MoviePlaying/movie_playing_screen.dart';
import 'movie_detail_notifier.dart';
class MovieDetailScreen extends StatefulWidget {
  static const String routeName = "/movie_detail";

  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailNotifier presenter;
  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieDetailNotifier>(context);
    String? swipeDirection;
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie detail'),
        backgroundColor: Colors.black87,
        // leading: BackButton(
        //   onPressed: (){Navigator.popAndPushNamed(context, MoviePage.routeName);},
        // ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/original/${presenter.movieDetailModel.backdropPath}'),
                      fit: BoxFit.cover
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(presenter.movieDetailModel.title ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.red),),
                    Text('Overview: ${presenter.movieDetailModel.overview ?? ''}'),
                    Text('Genre: ${presenter.movieDetailModel.genres?.map((e) => e.name).toList().join(",")}'),
                    Text('Vote Range: ${presenter.movieDetailModel.voteAverage ?? 0}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Text('Popularity: ${presenter.movieDetailModel.popularity ?? 0}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
