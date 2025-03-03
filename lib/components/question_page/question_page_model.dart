import '/components/player_score_input/player_score_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'question_page_widget.dart' show QuestionPageWidget;
import 'package:flutter/material.dart';

class QuestionPageModel extends FlutterFlowModel<QuestionPageWidget> {
  ///  Local state fields for this component.

  bool answerViewed = false;

  ///  State fields for stateful widgets in this component.

  // Models for playerScoreInput dynamic component.
  late FlutterFlowDynamicModels<PlayerScoreInputModel> playerScoreInputModels;

  @override
  void initState(BuildContext context) {
    playerScoreInputModels =
        FlutterFlowDynamicModels(() => PlayerScoreInputModel());
  }

  @override
  void dispose() {
    playerScoreInputModels.dispose();
  }
}
