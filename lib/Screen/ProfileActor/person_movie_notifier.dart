import 'package:flutter/material.dart';

import '../../model/person_movie_model.dart';
class PersonMovieNotifier extends ChangeNotifier{
  PersonMovieModel personMovieModel = PersonMovieModel();
  PersonMovieNotifier(BuildContext context, this.personMovieModel){

  }
}