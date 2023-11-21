

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/movie_detail_model.dart';
import '../../model/movie_favorite_model.dart';
import '../../model/movie_playing_model.dart';
import '../../model/movie_popular_model.dart';
import '../../model/movie_profile_model.dart';
import '../../model/movie_upcoming_model.dart';
import '../../model/person_movie_model.dart';
import '../MovieDetail/movie_detail_screen.dart';
import '../ProfileActor/person_movie_screen.dart';
import 'movie_playing_screen.dart';
import 'movie_playing_service.dart';

class MovieListNotifier extends ChangeNotifier {
  List<MoviePlaying> movieList = [];
  List<MoviePopularModel> popularList= [];
  List<MovieUpcomingModel> upcomingList= [];
  List<MovieFavoriteModel> favoriteList = [];
  List<MovieProfileModel> profileList =[];
  List<PersonMovieModel> personMovieList = [];
  MoviePlayingService service = MoviePlayingService();
  List<bool> pressedAttentions = [];
  MovieListNotifier(BuildContext context) {
    getMovieList(context);
    getFavoriteList(context);
    getProfileList(context);
    getPopularList(context);
    getUpcomingList(context);
  }


  void getMovieList(BuildContext context) async{
    Map jsonResult = await service.getMovieList(context,{});
    List resultList = jsonResult['results'] as List;
    resultList.forEach((element) {
      movieList.add(MoviePlaying.fromJson(element));

    });


    notifyListeners();
  }

  Future<void> goMovieDetail(BuildContext context, num movieId) async{
    Map jsonResult = await service.getMovieDetail(context, {}, movieId);
    MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(jsonResult);

    Navigator.pushNamed(context,MovieDetailScreen.routeName, arguments: movieDetailModel);
  }
  Future<void> goPersonMovie(BuildContext context, num person_id) async{
    Map jsonResult = await service.getPersonMovie(context, {}, person_id);
    List castJson = jsonResult['cast'] as List;
    castJson.forEach((element) {
      personMovieList.add(PersonMovieModel.fromJson(element));
    });
    PersonMovieModel personMovieModel = PersonMovieModel.fromJson(jsonResult);
    print('jsonResult: ${castJson}');
    print('personMovieModel.title:${personMovieList.map((e) => e.title)}');
    Navigator.pushNamed(context,PersonMovieScreen.routeName, arguments: personMovieModel);
  }

  void postFavoriteList(BuildContext context ,num id, bool isLike, String mess) async{

    await service.postFavoriteList(context, {
      "media_type": "movie",
      "media_id": id,
      "favorite": isLike,
    });

    Navigator.popAndPushNamed(context, MoviePage.routeName);
    // Provider.of<ApplicationNotifier>(context, listen: false)        .materialKey.currentState!.pop();
    ShowAlert(context, mess);
    notifyListeners();
  }

  void getFavoriteList(BuildContext context) async{
    Map jsonResult = await service.getFavoriteList(context, {});
    List resultList = jsonResult['results'] as List;
    resultList.forEach((elementFav) {
      favoriteList.add(MovieFavoriteModel.fromJson(elementFav));

    });
    notifyListeners();

  }

  void getProfileList(BuildContext context) async{
    Map jsonResult = await service.getProfileList(context,{});
    List resultList = jsonResult['results'] as List;
    resultList.forEach((element) {
      profileList.add(MovieProfileModel.fromJson(element));
      // resultList['know-for']
    });


    notifyListeners();
  }
  void getPopularList(BuildContext context) async{
    Map jsonResult = await service.getPopularList(context,{});
    List resultList = jsonResult['results'] as List;
    resultList.forEach((element) {
      popularList.add(MoviePopularModel.fromJson(element));

    });


    notifyListeners();
  }

  void getUpcomingList(BuildContext context) async{
    Map jsonResult = await service.getUpcomingList(context,{});
    List resultList = jsonResult['results'] as List;
    resultList.forEach((element) {
      upcomingList.add(MovieUpcomingModel.fromJson(element));

    });


    notifyListeners();
  }

  /////BottomNavBar
  int selectedIndex = 0;


  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };
  List<Widget> widgetOptions = <Widget>[
    MovieScreen(),
    FavScreen(),
    ProScreen(),
  ];

  void onItemTapped(int index,  BuildContext context) {
    selectedIndex = index;
    // switch(index){
    //   case 0:
    //     Navigator.pushNamed(context, MoviePage.routeName);
    //    break;
    //   case 1:
    //     Navigator.pushNamed(context, FavoriteScreen.routeName);
    //     break;
    //   case 2:
    //     Navigator.pushNamed(context, ProfileScreen.routeName);
    //     break;
    // }
    notifyListeners();
  }
  void ShowAlert(BuildContext context, String mess) async {
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        title: IconButton(
          alignment: Alignment.centerLeft,
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.close, color: Colors.black,),
          focusColor: Colors.red,
        ),
        content: Text(
          mess,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
        ),
      );
    });
  }
  isPressAttention(int index,  BuildContext context){
    var idFav =favoriteList.map((e) => e.id);
    movieList[index].isLiked = true;
    if(idFav.contains(movieList[index].id) == true){
      postFavoriteList(context, movieList[index].id ?? 0, false, 'You have remove favorite: ${movieList[index].title}');
      pressedAttentions[index] = false;
      notifyListeners();

    }
    else{
      pressedAttentions[index] = true;
      postFavoriteList(context, movieList[index].id ?? 0, true, 'You have favorite: ${movieList[index].title}');
      notifyListeners();
    }
  }

  void checkIdMo(){
    List idMo =movieList.map((e) => e.id).toList();
    List idFav = favoriteList.map((e) => e.id).toList();
    List indexFav =[];
    for(int i=0; i<idFav.length; i++){
      if ( idMo.indexOf(idFav[i]) != -1){
        indexFav.add(idMo.indexOf(idFav[i]));
      }
    }

    pressedAttentions = [];
    for(int i=0; i<idMo.length; i++){
      if(indexFav.contains(i)){
        pressedAttentions.add(true);
      }
      else{
        pressedAttentions.add(false);
      }
    }
  }




}