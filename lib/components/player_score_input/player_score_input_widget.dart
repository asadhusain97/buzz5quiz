import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_score_input_model.dart';
export 'player_score_input_model.dart';

/// card showing the total score of the player and the active player
class PlayerScoreInputWidget extends StatefulWidget {
  const PlayerScoreInputWidget({
    super.key,
    String? playerName,
    int? points,
    required this.index,
  })  : this.playerName = playerName ?? 'Vishwakant',
        this.points = points ?? 0;

  final String playerName;
  final int points;
  final int? index;

  @override
  State<PlayerScoreInputWidget> createState() => _PlayerScoreInputWidgetState();
}

class _PlayerScoreInputWidgetState extends State<PlayerScoreInputWidget> {
  late PlayerScoreInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerScoreInputModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: 240.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: _model.isPressed
              ? Color(0xFF212A2A)
              : FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: () {
              if (_model.lastAnsPos!) {
                return FlutterFlowTheme.of(context).success;
              } else if (_model.lastAnsNeg!) {
                return FlutterFlowTheme.of(context).error;
              } else {
                return FlutterFlowTheme.of(context).tertiary;
              }
            }(),
            width: 3.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: _model.lastAnsPos!
                        ? null
                        : () async {
                            if (_model.isPressed) {
                              if (_model.lastAnsNeg!) {
                                // add points
                                FFAppState().updatePlayerListAtIndex(
                                  widget!.index!,
                                  (e) => e
                                    ..incrementScore(widget!.points)
                                    ..updateAllPoints(
                                      (e) => e.remove((-1) * widget!.points),
                                    ),
                                );
                                safeSetState(() {});
                                // undo ans pos false
                                _model.lastAnsNeg = false;
                                safeSetState(() {});
                                _model.isPressed = !_model.isPressed;
                                safeSetState(() {});
                              }
                            } else {
                              // minus points
                              FFAppState().updatePlayerListAtIndex(
                                widget!.index!,
                                (e) => e
                                  ..incrementScore((-1) * widget!.points)
                                  ..updateAllPoints(
                                    (e) => e.add((-1) * widget!.points),
                                  ),
                              );
                              safeSetState(() {});
                              // ans pos false
                              _model.lastAnsNeg = true;
                              safeSetState(() {});
                              _model.isPressed = !_model.isPressed;
                              safeSetState(() {});
                            }
                          },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.minusSquare,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 50.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      color: _model.isPressed
                          ? Color(0xFF212A2A)
                          : FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      borderRadius: BorderRadius.circular(10.0),
                      hoverColor: _model.isPressed
                          ? Color(0x00000000)
                          : FlutterFlowTheme.of(context).error,
                      hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                      hoverElevation: 0.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget!.playerName.maybeHandleOverflow(
                      maxChars: 10,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: _model.lastAnsNeg!
                        ? null
                        : () async {
                            if (_model.isPressed) {
                              if (_model.lastAnsPos!) {
                                // undo add points
                                FFAppState().updatePlayerListAtIndex(
                                  widget!.index!,
                                  (e) => e
                                    ..incrementScore((-1) * widget!.points)
                                    ..updateAllPoints(
                                      (e) => e.remove(widget!.points),
                                    ),
                                );
                                safeSetState(() {});
                                // undo ans pos true
                                _model.lastAnsPos = false;
                                safeSetState(() {});
                                _model.isPressed = !_model.isPressed;
                                safeSetState(() {});
                                FFAppState()
                                    .removeAtIndexFromLastAnsCorrectPlayer(
                                        valueOrDefault<int>(
                                  functions.getLastIndexStr(FFAppState()
                                      .lastAnsCorrectPlayer
                                      .toList()),
                                  0,
                                ));
                                safeSetState(() {});
                              }
                            } else {
                              // add points
                              FFAppState().updatePlayerListAtIndex(
                                widget!.index!,
                                (e) => e
                                  ..incrementScore(widget!.points)
                                  ..updateAllPoints(
                                    (e) => e.add(widget!.points),
                                  ),
                              );
                              safeSetState(() {});
                              // ans pos true
                              _model.lastAnsPos = true;
                              safeSetState(() {});
                              _model.isPressed = !_model.isPressed;
                              safeSetState(() {});
                              FFAppState().addToLastAnsCorrectPlayer(
                                  widget!.playerName);
                              safeSetState(() {});
                            }
                          },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.plusSquare,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 50.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconAlignment: IconAlignment.start,
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      color: _model.isPressed
                          ? Color(0xFF212A2A)
                          : FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      borderRadius: BorderRadius.circular(10.0),
                      hoverColor: _model.isPressed
                          ? Color(0x00000000)
                          : FlutterFlowTheme.of(context).success,
                      hoverTextColor: FlutterFlowTheme.of(context).primaryText,
                      hoverElevation: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
