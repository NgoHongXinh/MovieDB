
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/base_service/api_dio.dart';
import 'movie_detail_interface.dart';
class MovieDetailService implements MovieDetailInterface{
  @override
  Future showMovieDetail(BuildContext context, Map<String, dynamic> body, num id)
  async {
    try{
      final res = await ApiDio.getInstance(context)!.createGet(
          "https://api.themoviedb.org/3/movie/${id}?language=en-US" ,
          // +"/api_key=20669942",
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
 
}