import 'dart:convert';
import 'dart:developer';

import 'package:flutter/src/widgets/framework.dart';

import '../../core/base_service/api_dio.dart';
import '../../core/constant/url_static.dart';
import 'favorite_interface.dart';

class FavoriteListService implements FavoriteListInterface{
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
  // @override
  // Future<dynamic> postFavoriteList(
  //     BuildContext context, Map<String, dynamic> body) async {
  //   try {
  //     final res = await ApiDio.getInstance(context)!.createPost(
  //         "https://api.themoviedb.org/3/" + UrlStatic.ADD_FAVORITE,
  //         showLoading: true,
  //         body: body,
  //         context: context);
  //     Map _resJson = jsonDecode(res.toString());
  //     return _resJson;
  //   } catch (e) {
  //     log("LOIROI ${e.toString()}");
  //   }
  // }


}