import 'package:flutter/material.dart';
abstract class FavoriteListInterface{
  // Future<dynamic> postFavoriteList(BuildContext context, Map<String, dynamic> body);
  Future<dynamic> getFavoriteList(BuildContext context, Map<String, dynamic> body);
}