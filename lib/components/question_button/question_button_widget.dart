import '/components/question_page/question_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'question_button_model.dart';
export 'question_button_model.dart';

/// question button that we can click and see the question
class QuestionButtonWidget extends StatefulWidget {
  const QuestionButtonWidget({
    super.key,
    int? qpoints,
    String? question,
    String? answer,
    String? setname,
    required this.questionMedia,
    required this.answerMedia,
  })  : this.qpoints = qpoints ?? 0,
        this.question = question ?? 'defaultquestion',
        this.answer = answer ?? 'defaultanswer',
        this.setname = setname ?? 'defaultsetname';

  final int qpoints;
  final String question;
  final String answer;
  final String setname;
  final String? questionMedia;
  final String? answerMedia;

  @override
  State<QuestionButtonWidget> createState() => _QuestionButtonWidgetState();
}

class _QuestionButtonWidgetState extends State<QuestionButtonWidget> {
  late QuestionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: QuestionPageWidget(
                  question: widget.question,
                  answer: widget.answer,
                  setname: widget.setname,
                  point: widget.qpoints,
                  qmedia: widget.questionMedia!,
                  amedia: widget.answerMedia!,
                  answerViewed: () async {
                    _model.done = !_model.done;
                    safeSetState(() {});
                  },
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        },
        child: Container(
          width: 160.0,
          height: 160.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              _model.done
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryText,
              FlutterFlowTheme.of(context).secondaryText,
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_model.done)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.done_outline_sharp,
                      color: FlutterFlowTheme.of(context).success,
                      size: 50.0,
                    ),
                  ),
                if (_model.done ? false : true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.qpoints.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 25.0,
                            letterSpacing: 0.0,
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
