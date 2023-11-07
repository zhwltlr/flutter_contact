import 'package:flutter/material.dart';

// app 실행 부분 메인페이지 넣기
void main() {
  runApp(const MyApp());
}

// 상단바, 하단바 처럼 바뀌지 않는 값들을 상수로 저장하여 사용
// const a = SizedBox(
//   child: Text('안녕'),
// )

// 메인 페이지 만드는 곳 - 이하 4줄은 기본적으로 들어가는 것
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          // 목록이 길어져도 스크롤 바는 생기지 않는다. 그렇기 때문에 ListView를 쓴다.
          // 스크롤 바가 위치하지 않는 곳은 메모리 삭제를 하여 성능개선을 해준다.
          children: [
            Text('안녕'),
            Text('안녕'),
            Text('안녕'),
            Text('안녕'),
          ],
        )
      )
    );
  }
}

// 왜 class?
// 커스텀 위젯은 class로 만든다.
// extends : 오른쪽 class 복사해주세요
// StatelessWidget : 완성품
class ShopItem extends StatelessWidget {
  const ShopItem({super.key}); // 어떤 파라미터를 쓸건지 정하는 부분

  // override : 기존 완성품에 있는 build보다 우선적으로 적용하기 위해 작성함
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text('안녕'),
    );
  }
}
