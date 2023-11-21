import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MoviePlaying/movie_playing_notifier.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "/profile_list";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late MovieListNotifier presenter;
  @override
  Widget build(BuildContext context) {
    presenter = Provider.of<MovieListNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('People List'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: presenter.profileList.length,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     childAspectRatio: 3/3,
            //     crossAxisCount: (MediaQuery.of(context).orientation == Orientation.landscape) ? 3 : 2),
            itemBuilder: (context, int index){
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
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
                          Text('Known for: ${presenter.profileList[index].knownFor?.map((e) => e.title).toList()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
