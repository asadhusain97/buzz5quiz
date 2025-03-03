// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends BaseStruct {
  PlayerStruct({
    String? name,
    int? score,
    List<int>? allPoints,
  })  : _name = name,
        _score = score,
        _allPoints = allPoints;

  // "name" field.
  String? _name;
  String get name => _name ?? 'John Doe';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "allPoints" field.
  List<int>? _allPoints;
  List<int> get allPoints => _allPoints ?? const [];
  set allPoints(List<int>? val) => _allPoints = val;

  void updateAllPoints(Function(List<int>) updateFn) {
    updateFn(_allPoints ??= []);
  }

  bool hasAllPoints() => _allPoints != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        name: data['name'] as String?,
        score: castToType<int>(data['score']),
        allPoints: getDataList(data['allPoints']),
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlayerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'score': _score,
        'allPoints': _allPoints,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.int,
        ),
        'allPoints': serializeParam(
          _allPoints,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.int,
          false,
        ),
        allPoints: deserializeParam<int>(
          data['allPoints'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlayerStruct &&
        name == other.name &&
        score == other.score &&
        listEquality.equals(allPoints, other.allPoints);
  }

  @override
  int get hashCode => const ListEquality().hash([name, score, allPoints]);
}

PlayerStruct createPlayerStruct({
  String? name,
  int? score,
}) =>
    PlayerStruct(
      name: name,
      score: score,
    );
