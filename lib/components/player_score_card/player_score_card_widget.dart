import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'player_score_card_model.dart';
export 'player_score_card_model.dart';

/// card showing the total score of the player and the active player
class PlayerScoreCardWidget extends StatefulWidget {
  const PlayerScoreCardWidget({
    super.key,
    String? playerName,
    int? playerScore,
    required this.controlPlayer,
  })  : this.playerName = playerName ?? 'Vishwakant',
        this.playerScore = playerScore ?? 0;

  final String playerName;
  final int playerScore;
  final String? controlPlayer;

  @override
  State<PlayerScoreCardWidget> createState() => _PlayerScoreCardWidgetState();
}

class _PlayerScoreCardWidgetState extends State<PlayerScoreCardWidget> {
  late PlayerScoreCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerScoreCardModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: Container(
        width: 200.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: widget.controlPlayer == widget.playerName
                ? FlutterFlowTheme.of(context).warning
                : FlutterFlowTheme.of(context).tertiary,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.playerName.maybeHandleOverflow(
                    maxChars: 10,
                    replacement: '…',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    formatNumber(
                      widget.playerScore,
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                    ),
                    '0',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
