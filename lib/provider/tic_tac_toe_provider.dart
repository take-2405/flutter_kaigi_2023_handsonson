// lib/provider/tic_tac_toe_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_kaigi_2023_handsonson/model/tic_tac_toe.dart';

final ticTacToeProvider = StateProvider.autoDispose<TicTacToe>((ref) {
  return TicTacToe.start();
});
