import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'player_score_input_widget.dart' show PlayerScoreInputWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerScoreInputModel extends FlutterFlowModel<PlayerScoreInputWidget> {
  ///  Local state fields for this component.

  bool isPressed = false;

  bool? lastAnsPos = false;

  bool? lastAnsNeg = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
