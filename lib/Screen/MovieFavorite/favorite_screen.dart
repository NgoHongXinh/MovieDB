import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MoviePlaying/movie_playing_notifier.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const String routeName = "/favorite_list";
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late MovieListNotifier presenter;
  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body:Container(
        child: GridView.builder(
            itemCount: presenter.favoriteList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2/3,
                crossAxisCount: (MediaQuery.of(context).orientation == Orientation.landscape) ? 3 : 2),
            itemBuilder: (context, int index){
              return InkWell(
                onTap: (){presenter.goMovieDetail(context, presenter.favoriteList[index].id ?? 0);},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: SizedBox(
                      // width: 300,
                      // height: 300,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/original/${presenter.favoriteList[index].posterPath}'),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.black,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

