import '/components/final_player_card/final_player_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'final_page_widget.dart' show FinalPageWidget;
import 'package:flutter/material.dart';

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
