import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Screen/ProfileActor/person_movie_notifier.dart';
class PersonMovieScreen extends StatelessWidget {
  static const String routeName = "/person_movie";
  const PersonMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late PersonMovieNotifier presenter;
    presenter = Provider.of<PersonMovieNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Movie'),
      ),
      body: Container(
        child: Text('${presenter.personMovieModel.popularity}'),
        // child: ListView.builder(
        //     itemCount: ,
        //     itemBuilder: (context, int index){
        //
        // }),
      ),
    );
  }
}
