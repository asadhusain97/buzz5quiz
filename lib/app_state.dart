import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Number of players playing the quiz
  List<PlayerStruct> _playerList = [];
  List<PlayerStruct> get playerList => _playerList;
  set playerList(List<PlayerStruct> value) {
    _playerList = value;
  }

  void addToPlayerList(PlayerStruct value) {
    playerList.add(value);
  }

  void removeFromPlayerList(PlayerStruct value) {
    playerList.remove(value);
  }

  void removeAtIndexFromPlayerList(int index) {
    playerList.removeAt(index);
  }

  void updatePlayerListAtIndex(
    int index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    playerList[index] = updateFn(_playerList[index]);
  }

  void insertAtIndexInPlayerList(int index, PlayerStruct value) {
    playerList.insert(index, value);
  }

  /// Name of the player who has the control of the board and has the last
  /// answer correct
  List<String> _lastAnsCorrectPlayer = [];
  List<String> get lastAnsCorrectPlayer => _lastAnsCorrectPlayer;
  set lastAnsCorrectPlayer(List<String> value) {
    _lastAnsCorrectPlayer = value;
  }

  void addToLastAnsCorrectPlayer(String value) {
    lastAnsCorrectPlayer.add(value);
  }

  void removeFromLastAnsCorrectPlayer(String value) {
    lastAnsCorrectPlayer.remove(value);
  }

  void removeAtIndexFromLastAnsCorrectPlayer(int index) {
    lastAnsCorrectPlayer.removeAt(index);
  }

  void updateLastAnsCorrectPlayerAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    lastAnsCorrectPlayer[index] = updateFn(_lastAnsCorrectPlayer[index]);
  }

  void insertAtIndexInLastAnsCorrectPlayer(int index, String value) {
    lastAnsCorrectPlayer.insert(index, value);
  }
}
