import '/backend/schema/structs/index.dart';
import '/components/final_player_card/final_player_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'final_page_widget.dart' show FinalPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FinalPageModel extends FlutterFlowModel<FinalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for finalPlayerCard dynamic component.
  late FlutterFlowDynamicModels<FinalPlayerCardModel> finalPlayerCardModels;

  @override
  void initState(BuildContext context) {
    finalPlayerCardModels =
        FlutterFlowDynamicModels(() => FinalPlayerCardModel());
  }

  @override
  void dispose() {
    finalPlayerCardModels.dispose();
  }
}
