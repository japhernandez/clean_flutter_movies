import 'package:equatable/equatable.dart';

class CastResultsEntity extends Equatable {
  final int? id;
  final List<CastEntity>? cast;
  final List<CastEntity>? crew;

  const CastResultsEntity({
    this.id,
    this.cast,
    this.crew,
  });

  @override
  List<Object?> get props => [id, cast, crew];
}

class CastEntity extends Equatable {
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

  CastEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        creditId,
        department,
        job,
      ];
}
