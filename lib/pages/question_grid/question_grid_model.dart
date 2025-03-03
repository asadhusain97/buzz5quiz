import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/player_score_card/player_score_card_widget.dart';
import '/components/question_button/question_button_widget.dart';
import '/components/set_name_card/set_name_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'question_grid_widget.dart' show QuestionGridWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class QuestionGridModel extends FlutterFlowModel<QuestionGridWidget> {
  ///  Local state fields for this page.

  List<String> setNamesInRound = [];
  void addToSetNamesInRound(String item) => setNamesInRound.add(item);
  void removeFromSetNamesInRound(String item) => setNamesInRound.remove(item);
  void removeAtIndexFromSetNamesInRound(int index) =>
      setNamesInRound.removeAt(index);
  void insertAtIndexInSetNamesInRound(int index, String item) =>
      setNamesInRound.insert(index, item);
  void updateSetNamesInRoundAtIndex(int index, Function(String) updateFn) =>
      setNamesInRound[index] = updateFn(setNamesInRound[index]);

  bool viewBoard = false;

  String roundSelected = 'Trial Round';

  List<int> roundIndexes = [];
  void addToRoundIndexes(int item) => roundIndexes.add(item);
  void removeFromRoundIndexes(int item) => roundIndexes.remove(item);
  void removeAtIndexFromRoundIndexes(int index) => roundIndexes.removeAt(index);
  void insertAtIndexInRoundIndexes(int index, int item) =>
      roundIndexes.insert(index, item);
  void updateRoundIndexesAtIndex(int index, Function(int) updateFn) =>
      roundIndexes[index] = updateFn(roundIndexes[index]);

  bool notSelected = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for playerScoreCard dynamic component.
  late FlutterFlowDynamicModels<PlayerScoreCardModel> playerScoreCardModels;
  // Models for setNameCard dynamic component.
  late FlutterFlowDynamicModels<SetNameCardModel> setNameCardModels;
  // Models for questionButton dynamic component.
  late FlutterFlowDynamicModels<QuestionButtonModel> questionButtonModels;

  @override
  void initState(BuildContext context) {
    playerScoreCardModels =
        FlutterFlowDynamicModels(() => PlayerScoreCardModel());
    setNameCardModels = FlutterFlowDynamicModels(() => SetNameCardModel());
    questionButtonModels =
        FlutterFlowDynamicModels(() => QuestionButtonModel());
  }

  @override
  void dispose() {
    playerScoreCardModels.dispose();
    setNameCardModels.dispose();
    questionButtonModels.dispose();
  }
}
