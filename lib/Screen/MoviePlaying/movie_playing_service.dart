import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/MoviePlaying/movie_playing_interface.dart';

import '../../core/base_service/api_dio.dart';
import '../../core/constant/url_static.dart';

class MoviePlayingService implements MoviePlayingInterface{
  @override
  Future getFavoriteList(BuildContext context, Map<String, dynamic> body) async {
    try{
      final response = await ApiDio.getInstance(context)!.createGet(
          "https://api.themoviedb.org/3/" + UrlStatic.FAVORITE_LIST,
          showLoading: true,
          body: body,
          context: context);
      Map _resJson = jsonDecode(response.toString());
      return _resJson;
    } catch (e) {
      log("LOIROI ${e.toString()}");
    }
    throw UnimplementedError();
  }

  @override
  Future getMovieList(BuildContext context, Map<String, dynamic> body)
  async {
    try{
      final res = await ApiDio.getInstance(context)!.createGet (
          "https://api.themoviedb.org/3/" + UrlStatic.MOVIE_PLAYING,
          showLoading: true,
          body: body,
          context: context);
      Map _resJson = jsonDecode(res.toString());
      return _resJson;
    } catch (e) {
      log("LOIROI ${e.toString()}");
      return  {};
    }
  }
  @override
  Future getMovieDetail(BuildContext context, Map<String, dynamic> body, num id)
  async {
    try{
      Response res = await ApiDio.getInstance(context)!.createGet(
          "https://api.themoviedb.org/3/movie/${id}?language=en-US" ,
          showLoading: false,
          body: body,
          context: context);
      Map _resJson = res.data;
      return _resJson;
    } catch (e) {
      log("LOIROI ${e.toString()}");
      return  {};
    }
  }
  Future<dynamic> postFavoriteList(
      BuildContext context, Map<String, dynamic> body) async {
    try {
      Response res = await ApiDio.getInstance(context)!.createPostMovie(
          "https://api.themoviedb.org/3/" + UrlStatic.ADD_FAVORITE,
          showLoading: true,
          body: body,
          context: context);
      Map _resJson = res.data as Map;

      return _resJson;

    } catch (e) {
      log("LOIROI ${e.toString()}");
    }
  }

  @override
  Future getProfileList(BuildContext context, Map<String, dynamic> body)
  async {
    try {
      final res = await ApiDio.getInstance(context)!.createGet(
          "https://api.themoviedb.org/3/" + UrlStatic.PEOPLE_LIST,
          showLoading: true,
          body: body,
          context: context);
      Map _resJson = jsonDecode(res.toString());
      return _resJson;
    } catch (e) {
      log("LOIROI ${e.toString()}");
      return {};
    }
  }

  @override
  Future getPersonMovie(BuildContext context, Map<String, dynamic> body, num person_id) async {
    try {
      final res = await ApiDio.getInstance(context)!.createGet(
          "https://api.themoviedb.org/3/person/${person_id}/movie_credits",
          showLoading: true,
          body: body,
          context: context);
      Map _resJson = jsonDecode(res.toString());
      return _resJson;
    } catch (e) {
      log("LOIROI ${e.toString()}");
      return {};
    }

  }

}