import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_kaigi_2023_handsonson/model/tic_tac_toe.dart';
import 'package:flutter_kaigi_2023_handsonson/repository/tic_tac_toe_repository.dart';

final getTicTacToeProvider = AutoDisposeStreamProvider<TicTacToe>(
  (ref) =>
      // 対戦相手同士のIDを設定する（プレイヤー名は後ほど変更します）
      ref.watch(ticTacToeRepositoryProvider).get(
            playerX: 'Dash',
            playerO: 'Sparky',
          ),
);
