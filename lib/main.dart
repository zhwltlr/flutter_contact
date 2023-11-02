import 'package:flutter/material.dart';

// app 실행 부분 메인페이지 넣기
void main() {
  runApp(const MyApp());
}

// 메인 페이지 만드는 곳 - 이하 4줄은 기본적으로 들어가는 것
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container( width: 50, height: 50, color: Colors.blue),
      )
    );
  }
}
