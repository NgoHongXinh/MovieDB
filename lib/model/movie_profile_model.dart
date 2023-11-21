/// adult : false
/// gender : 0
/// id : 3234630
/// known_for_department : "Acting"
/// name : "Sangeeth Shobhan"
/// original_name : "Sangeeth Shobhan"
/// popularity : 214.068
/// profile_path : "/7Vox31bH7XmgPNJzMKGa4uGyjW8.jpg"
/// known_for : [{"adult":false,"backdrop_path":"/jBnnkkXRZ0pV3Tw31Z2ALO638wA.jpg","id":1187075,"title":"MAD","original_language":"te","original_title":"MAD","overview":"Set in an engineering college and revolves around the antics of the students there, primarily the boys, who get a kick out of torturing the hostel warden.","poster_path":"/nDpOmgBfQZwOpFBcgokQGqd74r1.jpg","media_type":"movie","genre_ids":[35,10749,18],"popularity":8.388,"release_date":"2023-10-06","video":false,"vote_average":7,"vote_count":4},{"adult":false,"backdrop_path":"/1jof3bGVg67HLmvRHfTzqb2IODO.jpg","id":138179,"name":"Oka Chinna Family Story","original_language":"te","original_name":"ఒక చిన్న Family Story","overview":"Mahesh and his mother embark on an adventurous journey filled with hilarious situations as they try to make quick money to repay a huge loan.","poster_path":"/u1Tq2Qqb1oUJ6WSzVJqWk03LzEl.jpg","media_type":"tv","genre_ids":[35,10751],"popularity":7.198,"first_air_date":"2021-11-19","vote_average":7.5,"vote_count":2,"origin_country":["IN"]}]

class MovieProfileModel {
  MovieProfileModel({
      bool? adult, 
      num? gender, 
      num? id, 
      String? knownForDepartment, 
      String? name, 
      String? originalName, 
      num? popularity, 
      String? profilePath, 
      List<KnownFor>? knownFor,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _knownFor = knownFor;
}

  MovieProfileModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _originalName = json['original_name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
  }
  bool? _adult;
  num? _gender;
  num? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  num? _popularity;
  String? _profilePath;
  List<KnownFor>? _knownFor;
MovieProfileModel copyWith({  bool? adult,
  num? gender,
  num? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  num? popularity,
  String? profilePath,
  List<KnownFor>? knownFor,
}) => MovieProfileModel(  adult: adult ?? _adult,
  gender: gender ?? _gender,
  id: id ?? _id,
  knownForDepartment: knownForDepartment ?? _knownForDepartment,
  name: name ?? _name,
  originalName: originalName ?? _originalName,
  popularity: popularity ?? _popularity,
  profilePath: profilePath ?? _profilePath,
  knownFor: knownFor ?? _knownFor,
);
  bool? get adult => _adult;
  num? get gender => _gender;
  num? get id => _id;
  String? get knownForDepartment => _knownForDepartment;
  String? get name => _name;
  String? get originalName => _originalName;
  num? get popularity => _popularity;
  String? get profilePath => _profilePath;
  List<KnownFor>? get knownFor => _knownFor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['original_name'] = _originalName;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    if (_knownFor != null) {
      map['known_for'] = _knownFor?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// adult : false
/// backdrop_path : "/jBnnkkXRZ0pV3Tw31Z2ALO638wA.jpg"
/// id : 1187075
/// title : "MAD"
/// original_language : "te"
/// original_title : "MAD"
/// overview : "Set in an engineering college and revolves around the antics of the students there, primarily the boys, who get a kick out of torturing the hostel warden."
/// poster_path : "/nDpOmgBfQZwOpFBcgokQGqd74r1.jpg"
/// media_type : "movie"
/// genre_ids : [35,10749,18]
/// popularity : 8.388
/// release_date : "2023-10-06"
/// video : false
/// vote_average : 7
/// vote_count : 4

class KnownFor {
  KnownFor({
      bool? adult, 
      String? backdropPath, 
      num? id, 
      String? title, 
      String? originalLanguage, 
      String? originalTitle, 
      String? overview, 
      String? posterPath, 
      String? mediaType, 
      List<num>? genreIds, 
      num? popularity, 
      String? releaseDate, 
      bool? video, 
      num? voteAverage, 
      num? voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _id = id;
    _title = title;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _posterPath = posterPath;
    _mediaType = mediaType;
    _genreIds = genreIds;
    _popularity = popularity;
    _releaseDate = releaseDate;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  KnownFor.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _id = json['id'];
    _title = json['title'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _mediaType = json['media_type'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _popularity = json['popularity'];
    _releaseDate = json['release_date'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  num? _id;
  String? _title;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  String? _posterPath;
  String? _mediaType;
  List<num>? _genreIds;
  num? _popularity;
  String? _releaseDate;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;
KnownFor copyWith({  bool? adult,
  String? backdropPath,
  num? id,
  String? title,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  String? posterPath,
  String? mediaType,
  List<num>? genreIds,
  num? popularity,
  String? releaseDate,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => KnownFor(  adult: adult ?? _adult,
  backdropPath: backdropPath ?? _backdropPath,
  id: id ?? _id,
  title: title ?? _title,
  originalLanguage: originalLanguage ?? _originalLanguage,
  originalTitle: originalTitle ?? _originalTitle,
  overview: overview ?? _overview,
  posterPath: posterPath ?? _posterPath,
  mediaType: mediaType ?? _mediaType,
  genreIds: genreIds ?? _genreIds,
  popularity: popularity ?? _popularity,
  releaseDate: releaseDate ?? _releaseDate,
  video: video ?? _video,
  voteAverage: voteAverage ?? _voteAverage,
  voteCount: voteCount ?? _voteCount,
);
  bool? get adult => _adult;
  String? get backdropPath => _backdropPath;
  num? get id => _id;
  String? get title => _title;
  String? get originalLanguage => _originalLanguage;
  String? get originalTitle => _originalTitle;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  String? get mediaType => _mediaType;
  List<num>? get genreIds => _genreIds;
  num? get popularity => _popularity;
  String? get releaseDate => _releaseDate;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;
  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['id'] = _id;
    map['title'] = _title;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['media_type'] = _mediaType;
    map['genre_ids'] = _genreIds;
    map['popularity'] = _popularity;
    map['release_date'] = _releaseDate;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}