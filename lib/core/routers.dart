import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screen/MovieDetail/movie_detail_notifier.dart';
import '../Screen/MovieDetail/movie_detail_screen.dart';
import '../Screen/MovieFavorite/favorite_screen.dart';
import '../Screen/MoviePlaying/movie_playing_notifier.dart';
import '../Screen/MoviePlaying/movie_playing_screen.dart';
import '../Screen/ProfileActor/person_movie_notifier.dart';
import '../Screen/ProfileActor/person_movie_screen.dart';
import '../Screen/ProfileActor/profile_screen.dart';
import '../model/movie_detail_model.dart';
import '../model/person_movie_model.dart';
import '../splash/splash_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':

      case MoviePage.routeName:
        return MaterialPageRoute(
            builder: (_)=> ChangeNotifierProvider<MovieListNotifier>(
              create: (context)=> MovieListNotifier(context),
              child:   MoviePage(),
            ));

      case FavoriteScreen.routeName:
        return MaterialPageRoute(
            builder: (_)=> ChangeNotifierProvider<MovieListNotifier>(
              create: (context)=> MovieListNotifier(context),
              child:
              FavoriteScreen(),
            ));

      case ProfileScreen.routeName:
        return MaterialPageRoute(
            builder: (_)=> ChangeNotifierProvider<MovieListNotifier>(
              create: (context)=> MovieListNotifier(context),
              child: ProfileScreen(),
            ));
      case MovieDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (_)=> ChangeNotifierProvider<MovieDetailNotifier>(
              create: (context)=> MovieDetailNotifier(context, settings.arguments as MovieDetailModel),
              child:   MovieDetailScreen(),

            ));
      case PersonMovieScreen.routeName:
        return MaterialPageRoute(
            builder: (_)=> ChangeNotifierProvider<PersonMovieNotifier>(
              create: (context)=> PersonMovieNotifier(context, settings.arguments as PersonMovieModel),
              child:   PersonMovieScreen(),

            ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text(
                    'No route defined for ${settings.name}',
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ));
    }
  }
}