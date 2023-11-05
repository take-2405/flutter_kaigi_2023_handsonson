import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_kaigi_2023_handsonson/view/board.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_kaigi_2023_handsonson/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterKaigi 2023 - TicTacToe', //【タイトル差替】アプリ説明のタイトル
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(), //【新規追加】
      home: Scaffold(
        appBar: AppBar(
          //【新規追加】アプリバー
          title: const Text('FlutterKaigi 2023 - TicTacToe'), //【新規追加】アプリのタイトル
        ),
        body: const Board(),
      ),
    );
  }
}
