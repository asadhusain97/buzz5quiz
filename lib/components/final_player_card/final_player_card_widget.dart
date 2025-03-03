import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'final_player_card_model.dart';
export 'final_player_card_model.dart';

class FinalPlayerCardWidget extends StatefulWidget {
  const FinalPlayerCardWidget({
    super.key,
    required this.playerName,
    required this.score,
    required this.allPoints,
  });

  final String? playerName;
  final int? score;
  final List<int>? allPoints;

  @override
  State<FinalPlayerCardWidget> createState() => _FinalPlayerCardWidgetState();
}

class _FinalPlayerCardWidgetState extends State<FinalPlayerCardWidget> {
  late FinalPlayerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalPlayerCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 320.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: functions
                      .getIndexOfString(
                          widget!.playerName!, FFAppState().playerList.toList())
                      .toString() ==
                  '0'
              ? FlutterFlowTheme.of(context).warning
              : Color(0x00000000),
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: valueOrDefault<String>(
                          (valueOrDefault<int>(
                                    functions.getIndexOfString(
                                        widget!.playerName!,
                                        FFAppState().playerList.toList()),
                                    0,
                                  ) +
                                  1)
                              .toString(),
                          '0',
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: '. ',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget!.playerName,
                          'Joe',
                        ),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget!.score?.toString(),
                    '10',
                  ),
                  textAlign: TextAlign.end,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Correct answers:  ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              ((List<int> allPoints) {
                                return allPoints.where((num) => num > 0).length;
                              }(widget!.allPoints!.toList()))
                                  .toString(),
                              '1',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: '  (',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: '+',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              ((List<int> allPoints) {
                                return allPoints
                                    .where((num) => (num ?? 0) > 0)
                                    .fold<int>(
                                        0, (sum, num) => sum + (num ?? 0));
                              }(widget!.allPoints!.toList()))
                                  .toString(),
                              '10',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).secondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ')',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Wrong answers:  ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              ((List<int> allPoints) {
                                return allPoints.where((num) => num < 0).length;
                              }(widget!.allPoints!.toList()))
                                  .toString(),
                              '1',
                            ),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ' (',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              ((List<int> allPoints) {
                                return allPoints
                                    .where((num) => (num ?? 0) < 0)
                                    .fold<int>(
                                        0, (sum, num) => sum + (num ?? 0));
                              }(widget!.allPoints!.toList()))
                                  .toString(),
                              '10',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: ')',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
