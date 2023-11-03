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

  @override
  Widget build(BuildContext context) {
    //【差替】コンテンツを列方向(縦並び)に配置する Column を Padding でラップ（ここから）
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
        ],
      ),
    );
    //【差替】コンテンツを列方向(縦並び)に配置する Column を Padding でラップ（ここまで）
  }
}
