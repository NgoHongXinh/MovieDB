/// adult : false
/// backdrop_path : "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg"
/// genre_ids : [27,53]
/// id : 951491
/// original_language : "en"
/// original_title : "Saw X"
/// overview : "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps."
/// popularity : 755.378
/// poster_path : "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg"
/// release_date : "2023-09-26"
/// title : "Saw X"
/// video : false
/// vote_average : 7.414
/// vote_count : 1087

class MovieUpcomingModel {
  MovieUpcomingModel({
      bool? adult, 
      String? backdropPath, 
      List<num>? genreIds, 
      num? id, 
      String? originalLanguage, 
      String? originalTitle, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      String? releaseDate, 
      String? title, 
      bool? video, 
      num? voteAverage, 
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  MovieUpcomingModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<num>? _genreIds;
  num? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;
MovieUpcomingModel copyWith({  bool? adult,
  String? backdropPath,
  List<num>? genreIds,
  num? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => MovieUpcomingModel(  adult: adult ?? _adult,
  backdropPath: backdropPath ?? _backdropPath,
  genreIds: genreIds ?? _genreIds,
  id: id ?? _id,
  originalLanguage: originalLanguage ?? _originalLanguage,
  originalTitle: originalTitle ?? _originalTitle,
  overview: overview ?? _overview,
  popularity: popularity ?? _popularity,
  posterPath: posterPath ?? _posterPath,
  releaseDate: releaseDate ?? _releaseDate,
  title: title ?? _title,
  video: video ?? _video,
  voteAverage: voteAverage ?? _voteAverage,
  voteCount: voteCount ?? _voteCount,
);
  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  List<num>? get genreIds => _genreIds;
  num? get id => _id;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  num? get popularity => _popularity;
  String? get posterPath => _posterPath;
  String? get releaseDate => _releaseDate;
  String? get title => _title;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}