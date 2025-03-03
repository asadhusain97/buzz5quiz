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
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'question_grid_model.dart';
export 'question_grid_model.dart';

/// a page representing the question grid
class QuestionGridWidget extends StatefulWidget {
  const QuestionGridWidget({
    super.key,
    required this.startTime,
  });

  final DateTime? startTime;

  static String routeName = 'questionGrid';
  static String routePath = '/questionGrid';

  @override
  State<QuestionGridWidget> createState() => _QuestionGridWidgetState();
}

class _QuestionGridWidgetState extends State<QuestionGridWidget> {
  late QuestionGridModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionGridModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: SheetQsetCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final questionGridSheetQsetResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 80.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).info,
                  size: 35.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
                  child: Text(
                    'Buzz5 Grid',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              width: 400.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 20.0, 10.0, 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Round: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: functions
                                                    .getUniqueStrFromList(
                                                        SheetQsetCall.round(
                                                  questionGridSheetQsetResponse
                                                      .jsonBody,
                                                )!
                                                            .toList()),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                        .dropDownValue = val),
                                                width: 150.0,
                                                height: 40.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'Select round..',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                borderWidth: 0.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            if (_model.dropDownValue != null &&
                                                _model.dropDownValue != '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 8.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: Icon(
                                                    Icons.arrow_circle_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.viewBoard = false;
                                                    _model.notSelected = false;
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
                                                    _model.roundSelected =
                                                        _model.dropDownValue!;
                                                    safeSetState(() {});
                                                    _model.setNamesInRound =
                                                        functions
                                                            .filterSetNames(
                                                                SheetQsetCall
                                                                        .setName(
                                                                  questionGridSheetQsetResponse
                                                                      .jsonBody,
                                                                )!
                                                                    .toList(),
                                                                SheetQsetCall
                                                                        .round(
                                                                  questionGridSheetQsetResponse
                                                                      .jsonBody,
                                                                )!
                                                                    .toList(),
                                                                _model
                                                                    .roundSelected)
                                                            .toList()
                                                            .cast<String>();
                                                    _model.roundIndexes =
                                                        functions
                                                            .filterRoundIndex(
                                                                _model
                                                                    .roundSelected,
                                                                SheetQsetCall
                                                                        .round(
                                                                  questionGridSheetQsetResponse
                                                                      .jsonBody,
                                                                )!
                                                                    .toList())
                                                            .toList()
                                                            .cast<int>();
                                                    _model.viewBoard = true;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'Leaderboard',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
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
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 250.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final sortedPlayerList =
                                                        FFAppState()
                                                            .playerList
                                                            .sortedList(
                                                                keyOf: (e) =>
                                                                    e.score,
                                                                desc: true)
                                                            .toList()
                                                            .take(8)
                                                            .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        10.0,
                                                        0,
                                                        10.0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          sortedPlayerList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 5.0),
                                                      itemBuilder: (context,
                                                          sortedPlayerListIndex) {
                                                        final sortedPlayerListItem =
                                                            sortedPlayerList[
                                                                sortedPlayerListIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .playerScoreCardModels
                                                              .getModel(
                                                            sortedPlayerListIndex
                                                                .toString(),
                                                            sortedPlayerListIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              PlayerScoreCardWidget(
                                                            key: Key(
                                                              'Keyv5z_${sortedPlayerListIndex.toString()}',
                                                            ),
                                                            playerName:
                                                                sortedPlayerListItem
                                                                    .name,
                                                            playerScore:
                                                                valueOrDefault<
                                                                    int>(
                                                              sortedPlayerListItem
                                                                  .score,
                                                              0,
                                                            ),
                                                            controlPlayer:
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.getLastPlayerName(
                                                                  FFAppState()
                                                                      .lastAnsCorrectPlayer
                                                                      .toList()),
                                                              'PlayerOne',
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
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (_model.notSelected == false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().playerList =
                                                    functions
                                                        .rankPlayers(
                                                            FFAppState()
                                                                .playerList
                                                                .toList())
                                                        .toList()
                                                        .cast<PlayerStruct>();
                                                safeSetState(() {});

                                                context.pushNamed(
                                                  FinalPageWidget.routeName,
                                                  queryParameters: {
                                                    'gameTime': serializeParam(
                                                      valueOrDefault<int>(
                                                        functions
                                                            .getTotalGameTime(
                                                                widget
                                                                    .startTime!),
                                                        0,
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .bottomToTop,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'End Game',
                                              icon: FaIcon(
                                                FontAwesomeIcons.trophy,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 10.0))
                                    .addToStart(SizedBox(height: 5.0))
                                    .addToEnd(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 1080.0,
                            height: 800.0,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (_model.viewBoard) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 30.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final setNames = _model
                                                                    .setNamesInRound
                                                                    .toList()
                                                                    .take(5)
                                                                    .toList();

                                                                return ListView
                                                                    .separated(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              40.0),
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  itemCount:
                                                                      setNames
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              40.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          setNamesIndex) {
                                                                    final setNamesItem =
                                                                        setNames[
                                                                            setNamesIndex];
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .setNameCardModels
                                                                          .getModel(
                                                                        random_data
                                                                            .randomInteger(0,
                                                                                10)
                                                                            .toString(),
                                                                        setNamesIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              safeSetState(() {}),
                                                                      child:
                                                                          SetNameCardWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key8nw_${random_data.randomInteger(0, 10).toString()}',
                                                                        ),
                                                                        setname:
                                                                            setNamesItem,
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 50.0, 50.0),
                                              child: Container(
                                                height: 600.0,
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          50.0, 0.0, 50.0, 5.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final filtteredIndexes =
                                                          _model.roundIndexes
                                                              .toList();

                                                      return GridView.builder(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          10.0,
                                                          0,
                                                          10.0,
                                                          0,
                                                        ),
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 5,
                                                          mainAxisSpacing: 80.0,
                                                          childAspectRatio:
                                                              1.05,
                                                        ),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            filtteredIndexes
                                                                .length,
                                                        itemBuilder: (context,
                                                            filtteredIndexesIndex) {
                                                          final filtteredIndexesItem =
                                                              filtteredIndexes[
                                                                  filtteredIndexesIndex];
                                                          return wrapWithModel(
                                                            model: _model
                                                                .questionButtonModels
                                                                .getModel(
                                                              filtteredIndexesItem
                                                                  .toString(),
                                                              filtteredIndexesIndex,
                                                            ),
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                QuestionButtonWidget(
                                                              key: Key(
                                                                'Keyk48_${filtteredIndexesItem.toString()}',
                                                              ),
                                                              qpoints: (SheetQsetCall
                                                                      .points(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
                                                              question: (SheetQsetCall
                                                                      .question(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
                                                              answer: (SheetQsetCall
                                                                      .answer(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
                                                              setname: (SheetQsetCall
                                                                      .setName(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
                                                              questionMedia: (SheetQsetCall
                                                                      .qstnMedia(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
                                                              answerMedia: (SheetQsetCall
                                                                      .ansMedia(
                                                                questionGridSheetQsetResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .elementAtOrNull(
                                                                      filtteredIndexesItem))!,
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
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_model.dropDownValue == null ||
                      _model.dropDownValue == '')
                    Align(
                      alignment: AlignmentDirectional(-0.57, -0.99),
                      child: Lottie.asset(
                        'assets/jsons/Left_Arrow_Animated_Icon.json',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
