import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'instructions_widget.dart' show InstructionsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InstructionsModel extends FlutterFlowModel<InstructionsWidget> {
  ///  Local state fields for this page.

  bool uniquePlayersValidation = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for p1 widget.
  FocusNode? p1FocusNode;
  TextEditingController? p1TextController;
  String? Function(BuildContext, String?)? p1TextControllerValidator;
  // State field(s) for p2 widget.
  FocusNode? p2FocusNode;
  TextEditingController? p2TextController;
  String? Function(BuildContext, String?)? p2TextControllerValidator;
  // State field(s) for p3 widget.
  FocusNode? p3FocusNode;
  TextEditingController? p3TextController;
  String? Function(BuildContext, String?)? p3TextControllerValidator;
  // State field(s) for p4 widget.
  FocusNode? p4FocusNode;
  TextEditingController? p4TextController;
  String? Function(BuildContext, String?)? p4TextControllerValidator;
  // State field(s) for p5 widget.
  FocusNode? p5FocusNode;
  TextEditingController? p5TextController;
  String? Function(BuildContext, String?)? p5TextControllerValidator;
  // State field(s) for p6 widget.
  FocusNode? p6FocusNode;
  TextEditingController? p6TextController;
  String? Function(BuildContext, String?)? p6TextControllerValidator;
  // State field(s) for p7 widget.
  FocusNode? p7FocusNode;
  TextEditingController? p7TextController;
  String? Function(BuildContext, String?)? p7TextControllerValidator;
  // State field(s) for p8 widget.
  FocusNode? p8FocusNode;
  TextEditingController? p8TextController;
  String? Function(BuildContext, String?)? p8TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    p1FocusNode?.dispose();
    p1TextController?.dispose();

    p2FocusNode?.dispose();
    p2TextController?.dispose();

    p3FocusNode?.dispose();
    p3TextController?.dispose();

    p4FocusNode?.dispose();
    p4TextController?.dispose();

    p5FocusNode?.dispose();
    p5TextController?.dispose();

    p6FocusNode?.dispose();
    p6TextController?.dispose();

    p7FocusNode?.dispose();
    p7TextController?.dispose();

    p8FocusNode?.dispose();
    p8TextController?.dispose();
  }
}
