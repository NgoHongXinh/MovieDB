import 'package:flutter/material.dart';
import '../../model/movie_favorite_model.dart';
import 'favorite_service.dart';

class FavoriteListNotifier  extends ChangeNotifier{
  List<MovieFavoriteModel> favoriteList = [];

  FavoriteListService service = FavoriteListService();

  FavoriteListNotifier(BuildContext context) {
    getFavoriteList(context);
  }

  void getFavoriteList(BuildContext context) async{
    Map jsonResult = await service.getFavoriteList(context, {});

    List resultList = jsonResult['results'] as List;
    resultList.forEach((element) {
      favoriteList.add(MovieFavoriteModel.fromJson(element));
    });

  }
  // Future<void> postFavoriteList(BuildContext context ,num id, bool islike) async{
  //   print("ffffff${context}");
  //   print("fff${id}");
  //   Map jsonResult = await service.postFavoriteList(context, {
  //
  //     "media_type": "movie",
  //     "media_id": id,
  //     "favorite": islike,
  //
  //   });
  //   getFavoriteList(context);
  //   print("aaaaaaaaaaaaaaaaaaaaaaa ${jsonResult}");
  //   if(jsonResult['status_code'] == 1 ){
  //     // AlertDialog(
  //     //     shape: RoundedRectangleBorder(
  //     //         borderRadius: BorderRadius.all(Radius.circular(30))
  //     //     ),
  //     //     insetPadding: EdgeInsets.zero,
  //     //     title: IconButton(
  //     //       alignment: Alignment.centerLeft,
  //     //       onPressed: (){Navigator.of(context).pop();},
  //     //       icon: Icon(Icons.close),
  //     //     ),
  //     //     content: Padding(
  //     //       padding: const EdgeInsets.all(10.0),
  //     //       child:  Text(
  //     //         "them thanh cong",textAlign: TextAlign.center,
  //     //       ),
  //     //     ),
  //     // );
  //   }
  //
  //   // MovieFavoriteModel movieFavoriteModel = MovieFavoriteModel.fromJson(jsonDecode(jsonResult['results']));
  //   // List resultList = jsonResult['results'] as List;
  //   // resultList.forEach((element) {
  //   //   favoriteList.add(MovieFavoriteModel.fromJson(element));
  //   // });
  //   // List resultList = jsonResult['results'] as List;
  //   // resultList.forEach((element) {
  //   //   favoriteFlagList.add(FavoriteFlafModel.fromJson(element));
  //   // });
  // }
}
