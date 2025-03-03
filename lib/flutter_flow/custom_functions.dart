import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<int>? getUniqueIntFromList(List<int> inputlist) {
// function that takes a list of int and returns a list of only unique values from the list. Make sure the order stays the same of all the items.
  List<int> uniqueList = [];
  inputlist.forEach((element) {
    if (!uniqueList.contains(element)) {
      uniqueList.add(element);
    }
  });
  return uniqueList;
}

List<String> getUniqueStrFromList(List<String> inputlist) {
  List<String> uniqueList = [];
  inputlist.forEach((element) {
    if (!uniqueList.contains(element)) {
      uniqueList.add(element);
    }
  });
  return uniqueList;
}

bool checkUniquePlayerNames(List<PlayerStruct> playerList) {
// a function that takes in a list of custom data types called players (name, score, allpoints) and checks if all the names are unique. If not return false.
  List<String> playerNames =
      playerList.map((player) => player.name.trim()).toList();
  List<String> uniqueNames = playerNames.toSet().toList();

  return playerNames.length == uniqueNames.length;
}

int? getLastIndexInt(List<int>? indexList) {
  // I want a function that can take in a list of integers and returns the index of the last element of the list
  if (indexList == null || indexList.isEmpty) {
    return 0;
  }

  return indexList.length - 1;
}

String getLastPlayerName(List<String> playerList) {
// takes in a list of strings and returns the last element of the list
  if (playerList.isEmpty) {
    return '';
  }

  return playerList.last;
}

int getLastIndexStr(List<String> inputList) {
  return math.max(inputList.length - 1, 0);
}

List<PlayerStruct> rankPlayers(List<PlayerStruct> playerList) {
  // Function that ranks players based on score, total negative points, and name
  playerList.sort((a, b) {
    if (a.score != b.score) {
      return b.score.compareTo(a.score);
    } else {
      int aTotalNegativePoints = a.allPoints
          .where((point) => point < 0)
          .fold(0, (sum, point) => sum + point);
      int bTotalNegativePoints = b.allPoints
          .where((point) => point < 0)
          .fold(0, (sum, point) => sum + point);

      if (aTotalNegativePoints != bTotalNegativePoints) {
        return aTotalNegativePoints.compareTo(bTotalNegativePoints);
      } else {
        return a.name.compareTo(b.name);
      }
    }
  });

  return playerList;
}

int countTotalCorrectAns(List<PlayerStruct> playerList) {
  int correctCount = 0;
  for (var player in playerList) {
    // Count each positive number in allPoints as a correct answer.
    for (var point in player.allPoints) {
      if (point > 0) {
        correctCount++;
      }
    }
  }
  return correctCount;
}

int countTotalWrongAns(List<PlayerStruct> playerList) {
  int correctCount = 0;
  for (var player in playerList) {
    // Count each positive number in allPoints as a correct answer.
    for (var point in player.allPoints) {
      if (point < 0) {
        correctCount++;
      }
    }
  }
  return correctCount;
}

double getAvgScore(List<PlayerStruct> playerList) {
  if (playerList.isEmpty) return 0;
  int total = 0;
  for (var player in playerList) {
    total += player.score;
  }
  return total / playerList.length;
}

int getTotalAttempts(List<PlayerStruct> playerList) {
  int attemptCount = 0;
  for (var player in playerList) {
    attemptCount += player.allPoints.length;
  }
  return attemptCount;
}

int getTotalGameTime(DateTime startTime) {
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(startTime);

  return difference.inMinutes;
}

List<String> filterSetNames(
  List<String> list1,
  List<String> list2,
  String filterString,
) {
  // Get indexes where list2 elements match the filterString
  List<int> matchingIndexes = [];

  for (int i = 0; i < list2.length; i++) {
    if (list2[i] == filterString) {
      matchingIndexes.add(i);
    }
  }

  // Use matching indexes to filter list1
  List<String> filteredList1 =
      matchingIndexes.map((index) => list1[index]).toList();

  // get unique set name
  List<String> uniqueList = [];
  filteredList1.forEach((element) {
    if (!uniqueList.contains(element)) {
      uniqueList.add(element);
    }
  });

  return uniqueList;
}

List<int> filterRoundIndex(
  String filterString,
  List<String> inputList,
) {
  List<int> matchingIndexes = [];

  for (int i = 0; i < inputList.length; i++) {
    if (inputList[i] == filterString) {
      matchingIndexes.add(i);
    }
  }

  return matchingIndexes;
}

int getIndexOfString(
  String filterString,
  List<PlayerStruct> inpputList,
) {
  // input is a filter string and a list of datatype player (name str, score int, allpoint list). And I get back the index of the player with the name same as the filter string. All player names are unique
  for (int i = 0; i < inpputList.length; i++) {
    if (inpputList[i].name == filterString) {
      return i;
    }
  }
  return 0;
}
