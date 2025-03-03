import '/components/player_score_input/player_score_input_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'question_page_model.dart';
export 'question_page_model.dart';

class QuestionPageWidget extends StatefulWidget {
  const QuestionPageWidget({
    super.key,
    required this.answerViewed,
    String? question,
    String? answer,
    String? setname,
    int? point,
    required this.qmedia,
    required this.amedia,
  })  : this.question = question ?? 'default question',
        this.answer = answer ?? 'default answer',
        this.setname = setname ?? 'default setname',
        this.point = point ?? 0;

  final Future Function()? answerViewed;
  final String question;
  final String answer;
  final String setname;
  final int point;
  final String? qmedia;
  final String? amedia;

  @override
  State<QuestionPageWidget> createState() => _QuestionPageWidgetState();
}

class _QuestionPageWidgetState extends State<QuestionPageWidget> {
  late QuestionPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionPageModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 40.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        widget.setname,
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.point.toString(),
                          '0',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            100.0, 20.0, 100.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.question != '')
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 25.0),
                                  child: Text(
                                    widget.question,
                                    textAlign: TextAlign.center,
                                    maxLines: 10,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (widget.qmedia != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            widget.qmedia!,
                                            fit: BoxFit.contain,
                                            alignment: Alignment(0.0, 0.0),
                                          ),
                                          allowRotation: false,
                                          tag: widget.qmedia!,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: widget.qmedia!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        widget.qmedia!,
                                        width: 250.0,
                                        height: 200.0,
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(width: 100.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          100.0, 0.0, 100.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              width: 1000.0,
                              height: 180.0,
                              constraints: BoxConstraints(
                                minHeight: 100.0,
                                maxHeight: 180.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1.0, 1.0, 1.0, 1.0),
                                  child: Builder(
                                    builder: (context) {
                                      final playerListQ =
                                          FFAppState().playerList.toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0.0,
                                          0,
                                          0.0,
                                        ),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: math.min(
                                              FFAppState().playerList.length,
                                              4),
                                          crossAxisSpacing: 1.0,
                                          mainAxisSpacing: 1.0,
                                          childAspectRatio: 3.8,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: playerListQ.length,
                                        itemBuilder:
                                            (context, playerListQIndex) {
                                          final playerListQItem =
                                              playerListQ[playerListQIndex];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .playerScoreInputModels
                                                  .getModel(
                                                playerListQIndex.toString(),
                                                playerListQIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: PlayerScoreInputWidget(
                                                key: Key(
                                                  'Key0cn_${playerListQIndex.toString()}',
                                                ),
                                                playerName:
                                                    valueOrDefault<String>(
                                                  playerListQItem.name,
                                                  'John Doe',
                                                ),
                                                points: widget.point,
                                                index: playerListQIndex,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 30.0)),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.answerViewed = !_model.answerViewed;
                        safeSetState(() {});
                      },
                      text: 'Show Answer',
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 35.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    if (_model.answerViewed)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.answer != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      100.0, 10.0, 100.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Text(
                                            widget.answer,
                                            textAlign: TextAlign.center,
                                            maxLines: 8,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 28.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (widget.amedia != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      widget.amedia!,
                                                      fit: BoxFit.contain,
                                                      alignment:
                                                          Alignment(0.0, 0.0),
                                                    ),
                                                    allowRotation: false,
                                                    tag: widget.amedia!,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: widget.amedia!,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  widget.amedia!,
                                                  width: 250.0,
                                                  height: 200.0,
                                                  fit: BoxFit.scaleDown,
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await widget.answerViewed?.call();
                                              Navigator.pop(context);
                                            },
                                            text: 'Done',
                                            options: FFButtonOptions(
                                              width: 150.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 100.0)),
                                  ),
                                ),
                            ]
                                .divide(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
