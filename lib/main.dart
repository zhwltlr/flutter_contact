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
      home: Scaffold(
        appBar: AppBar( leading: Icon(Icons.list),title: Text('marketplace'), actions: [Icon(Icons.search),Icon(Icons.list),Icon(Icons.notifications)],),
        body: Container(
          height: 150,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Image.asset('assets/profile.png', width: 150,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('123', style: TextStyle(fontWeight: FontWeight.w700 ),),
                    Text('1234', style: TextStyle(fontWeight: FontWeight.w500),),
                    Text('skjdhfjksfh'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
            ],
          ),
        ),
      ),
      )
    );
  }
}
