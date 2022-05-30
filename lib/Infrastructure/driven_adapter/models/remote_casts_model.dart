import 'package:clean_flutter_movies/Domain/entities/cast_entity.dart';

class RemoteCastResultsModel {
  int? id;
  List<RemoteCastModel>? cast;
  List<RemoteCastModel>? crew;

  RemoteCastResultsModel({
    this.id,
    this.cast,
    this.crew,
  });

  factory RemoteCastResultsModel.fromJson(Map json) {
    return RemoteCastResultsModel(
      id: json['id'],
      cast: json['cast']
          .map<RemoteCastModel>(
              (castJson) => RemoteCastModel.fromJson(castJson))
          .toList(),
      crew: json['crew']
          .map<RemoteCastModel>(
              (crewJson) => RemoteCastModel.fromJson(crewJson))
          .toList(),
    );
  }

  CastResultsEntity toEntity() => CastResultsEntity(
        id: id,
        cast: cast!.map((ca) => ca.toEntity()).toList(),
        crew: crew!.map((ca) => ca.toEntity()).toList(),
      );
}

class RemoteCastModel {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  RemoteCastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  factory RemoteCastModel.fromJson(Map json) {
    return RemoteCastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }

  CastEntity toEntity() => CastEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        creditId: creditId,
        department: department,
        job: job,
      );
}
