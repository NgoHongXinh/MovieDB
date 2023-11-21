
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie_playing_notifier.dart';

class MoviePage extends StatefulWidget {
  static const String routeName = "/movie_list";
  const MoviePage({Key? key}) : super(key: key);

  @override


  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late MovieListNotifier presenter;

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);
    presenter.checkIdMo();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        selectedIndex: presenter.selectedIndex,
        onDestinationSelected: (int index) => presenter.onItemTapped(index,context),
        animationDuration: const Duration(seconds: 3),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: Colors.grey.shade300,
        elevation: 2,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.video_library_outlined),
            label: 'movie',
            selectedIcon: Icon(Icons.video_library),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'favorite',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            label: 'profile',
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: presenter.widgetOptions.elementAt(presenter.selectedIndex),
    );
  }
// buildNavigator() {
//   return Navigator(
//     key: presenter.navigatorKeys[presenter.selectedIndex],
//     onGenerateRoute: (RouteSettings settings){
//       return MaterialPageRoute(builder: (_) => presenter.widgetOptions.elementAt(presenter.selectedIndex));
//     },
//   );
// }
}

class MovieScreen extends StatelessWidget{
  late MovieListNotifier presenter;
  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);

    return Container(
      child: GridView.builder(
          itemCount: presenter.movieList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2/3,
              crossAxisCount: (MediaQuery.of(context).orientation == Orientation.landscape) ? 3 : 2),
          itemBuilder: (context, int index){
            return GestureDetector(
              onTap: (){presenter.goMovieDetail(context, presenter.movieList[index].id ?? 0);},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SizedBox(

                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        image: DecorationImage(
                          image: NetworkImage('https://image.tmdb.org/t/p/original/${presenter.movieList[index].posterPath}'),
                          fit: BoxFit.fill,
                          opacity: 0.8,
                        ),
                        color: Colors.black,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(presenter.movieList[index].title ??'', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (){ presenter.isPressAttention(index, context);},
                              icon: Icon(
                                Icons.favorite,color:presenter.pressedAttentions[index]==false?Colors.white:Colors.red.shade900,size: 40,)
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

}

class FavScreen extends StatelessWidget{
  late MovieListNotifier presenter;
  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);
    return Container(
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
                        border: Border.all(width: 2, color: Colors.black),
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
    );
  }

}

class ProScreen extends StatelessWidget{
  late MovieListNotifier presenter;

  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      child: ListView.builder(
          itemCount: presenter.profileList.length,
          itemBuilder: (context, int index){
            return GestureDetector(
              onTap: (){presenter.goPersonMovie(context, presenter.profileList[index].id ?? 0);},
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/original/${presenter.profileList[index].profilePath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${presenter.profileList[index].name}'),
                          Text('Popularity: ${presenter.profileList[index].popularity}'),
                          Text('Know for department: ${presenter.profileList[index].knownForDepartment}'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: presenter.profileList[index].knownFor!.map((film) =>Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text('${film.title}'),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 60,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  border: Border.all(width: 1, color: Colors.brown),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset: const Offset(
                                                        5.0,
                                                        5.0,
                                                      ), //Offset
                                                      blurRadius: 5.0,
                                                      spreadRadius: 2.0,
                                                    ), //BoxShadow
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: const Offset(0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ), //BoxShadow
                                                  ],
                                                  image: DecorationImage(
                                                      image:  NetworkImage('https://image.tmdb.org/t/p/original/${film.posterPath}'),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    ).toList())),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

}
