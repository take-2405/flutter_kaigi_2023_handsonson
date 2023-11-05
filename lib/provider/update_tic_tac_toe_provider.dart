import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_kaigi_2023_handsonson/model/tic_tac_toe.dart';
import 'package:flutter_kaigi_2023_handsonson/repository/tic_tac_toe_repository.dart';

final updateTicTacToeProvider =
    AutoDisposeFutureProviderFamily<void, TicTacToe>(
  (ref, arg) => ref.watch(ticTacToeRepositoryProvider).update(arg),
);
