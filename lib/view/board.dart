import 'package:flutter/material.dart';
import 'package:flutter_kaigi_2023_handsonson/model/tic_tac_toe.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BoardState();
  }
}

class _BoardState extends State<Board> {
  //【新規追加】ゲーム進行状態の初期値
  TicTacToe ticTacToe = TicTacToe.start(playerX: 'Dash', playerO: 'Sparky');

  String _statusMessage(TicTacToe ticTacToe) {
    final winner = ticTacToe.getWinner();
    final isDraw = ticTacToe.isDraw();

    if (winner.isNotEmpty) {
      return '$winnerの勝ち';
    } else if (isDraw) {
      return '引き分けです';
    } else {
      return '${ticTacToe.currentPlayer}の番';
    }
  }

  @override
  Widget build(BuildContext context) {
    //【差替】コンテンツを列方向(縦並び)に配置する Column を Padding でラップ（ここから）
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // メッセージ表示欄
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _statusMessage(ticTacToe),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          //
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横方向のマス個数（３個）
            ),
            itemCount: 9, //縦横のマス個数（３×３）
            itemBuilder: (context, index) {
              //【新規追加】（ここから）
              final row = index ~/ 3;
              final col = index % 3;
              final mark =
                  ticTacToe.board[row][col]; //ゲーム進捗状態から、マス目に対応する○×マークを取得
              return GestureDetector(
                onTap: () {
                  setState(() {
                    final winner = ticTacToe.getWinner();
                    if (mark.isEmpty && winner.isEmpty) {
                      ticTacToe = ticTacToe.placeMark(row, col);
                    }
                  });
                },
                child: Container(
                  //マス目の縦横罫線をGrayで描画
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    //マス目の ○×マーク（もしくは空欄）を描画
                    child: Text(
                      mark,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              );
            },
          ),
          // 盤面との空隙
          const SizedBox(height: 16),
          //
          // ゲーム・リセットボタン
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ticTacToe = ticTacToe.resetBoard();
                });
              },
              child: const Text('ゲームをリセット'),
            ),
          ),
          //
        ],
      ),
    );
    //【差替】コンテンツを列方向(縦並び)に配置する Column を Padding でラップ（ここまで）
  }
}
