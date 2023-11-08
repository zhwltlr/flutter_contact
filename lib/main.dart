import 'package:flutter/material.dart';

// app 실행 부분 메인페이지 넣기
void main() {
  runApp(MaterialApp(
      home: MyApp()
    )
  );
}

// 상단바, 하단바 처럼 바뀌지 않는 값들을 상수로 저장하여 사용
// const a = SizedBox(
//   child: Text('안녕'),
// )

// 메인 페이지 만드는 곳 - 이하 4줄은 기본적으로 들어가는 것
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var cnt = 1;
  var name = ['김영숙','홍길동','피자집'];
  var like = [0,0,0];

  @override
  Widget build(BuildContext context) {
    // context 는 부모요소가 누군지 알려줌(족보같은 개념!!)
    return Scaffold(
        appBar: AppBar(
          title: Text('연락처앱'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: ( context , i ){
            print(i);
            return ListTile(
              leading: Image.asset('profile.png'),
              title: Text(name[i]),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(),
        // 전구로 wrap with builder 만들면, context를 생성해준다
        floatingActionButton: FloatingActionButton(
          child: Text(cnt.toString()),
          onPressed: (){
            print(context.findAncestorWidgetOfExactType<MaterialApp>());
            showDialog(context: context, builder: (context){
              return Dialog(
                child: Column(
                  children: [
                    Text('Contact'),
                    // InputChip(label: label),
                    Row(
                      children: [
                        Text('Cancle'),
                        Text('OK')
                      ],
                    )
                  ],
                ),
              );
            });
          },
        ),
      );
   }
}

// 왜 class?
// 커스텀 위젯은 class로 만든다.
// extends : 오른쪽 class 복사해주세요
// StatelessWidget : 완성품
// class ShopItem extends StatelessWidget {
//   const ShopItem({super.key}); // 어떤 파라미터를 쓸건지 정하는 부분
//
//   // override : 기존 완성품에 있는 build보다 우선적으로 적용하기 위해 작성함
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//       child: Text('안녕'),
//     );
//   }
// }

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ],
        ),
    );
  }
}

