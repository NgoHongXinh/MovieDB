import 'package:flutter/material.dart';
abstract class MoviePlayingInterface {
  Future<dynamic> getMovieList(BuildContext context, Map<String, dynamic> body);
  Future<dynamic> getFavoriteList(BuildContext context, Map<String, dynamic> body);
  Future<dynamic> postFavoriteList(BuildContext context, Map<String, dynamic> body);
  Future<dynamic> getProfileList(BuildContext context, Map<String, dynamic> body);
  Future<dynamic> getMovieDetail(BuildContext context, Map<String, dynamic> body, num id);
  Future<dynamic> getPersonMovie(BuildContext context, Map<String, dynamic> body, num id);
}