import '/backend/schema/structs/index.dart';
import '/components/player_score_input/player_score_input_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'question_page_widget.dart' show QuestionPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
