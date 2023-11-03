# contact

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## About Flutter
- 디자인 어려워하는 사람에게 좋다
- 빠른 성능, 앱 조작시 눈에 보이는 피드백, 전환 애니메이션, 버그 없는 반응형 레이아웃
- 웹개발과 개발 방식이 같다

## Ubuntu Setup

Install Flutter
```bash
sudo snap install flutter --classic
```

Install Android Studio
```bash
sudo apt-add-repository ppa:maarten-fonville/android-studio
sudo apt-get update
sudo apt-get install android-studio
```
설치 후 SDK Tools 탭으로 들어가서 Android SDK Command-line tools 부분체크하고 적용!!
한글 적용하고 싶다면, File > Settings > Editor > Inspections > 상단Profile을 Default로 선택 > Proofreading > Typo 부분을 체크해제

설치가 완료되면 flutter 디렉토리로 이동하여 `PATH` 설정을 해준다.
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

모두 설치가 되면 `flutter doctor`로 잘 설치되었는지 확인
<div align="center">
<img src ="https://github.com/zhwltlr/flutter_contact/assets/100506719/ac34c921-0789-431c-927d-c23c8e8a6bd4" width="600" align="center">
</div>

### Unable to determine Android Studio version Error
- [스텍오버플로우에서 찾은 해결](https://stackoverflow.com/questions/77271274/flutter-doctor-unable-to-determine-android-studio-version)

## 3. Widget 설정
글자 넣기
```bash
MaterialApp(
  home: Text('flutter')
)
```

아이콘 넣기
```bash
MaterialApp(
  home: Icon(Icons.star)
)
```

이미지 넣기
- pubspec.yaml 에서 이미지 등록 설정 해주기
    ```bash
     flutter:
          assets:
            - assets/ 
    ```
- main.dart에서 이미지 넣어주기
    ```bash
    MaterialApp(
      home: Image.asset('assets/image.png')
    ) 
    ```
  
박스 넣기
- flutter의 단위 : Flutter의 모든 단위는 LP입니다. Logical Pixel 이라고 부르는데 px로 넣지 않는 이유는 기기마다 픽셀의 절대적인 크기가 다르기 때문, LP는 우리가 눈으로 보는 절대적인 수치
    ```bash
    MaterialApp(
      home: Center( 
        child: Container(width : 50, height : 50, color: Colors.blue) 
      )
    )
    ```


위젯 안의 위젯
```bash
MaterialApp(
  home: Container( 
    child: Text('박스안 위젯')
  )
)
```

## 4. Scaffold(), Row()/Column()

Scaffold()
  - 상단 / 중단 / 하단을 쉽게 나누어 주는 역할
  ```bash
  MaterialApp(
    home: Scaffold(
      appBar: top widget,
      body: middle widget,
      bottomNavigationBar: bottom widget,
    )
  ); 
  ```
Row()/Column()
  - 가로와 세로의 배치 (css의 flex와 유사한 역할을 함)
  - 간격 조절을 하고 싶다면, `mainAxisAlignment: MainAxisAlignment.블라블라,`, `crossAxisAlignment: CrossAxisAlignment.블라블라`설정해준다.
  - mainAxis는 중심이 되는 축으로 Row()는 가로축, Column()은 세로축이 된다.
  - 이의 반대가 되는 축으로 정렬을 하면 Row()는 세로축, Column()은 가로축이 된다.
  - .spaceEvenly, .spaceBetween, .spaceAround, .start, .end, .center

  ```bash
  MaterialApp(
    home: Scaffold(
      body: Row( // or Column 
        children: [ Icon(Icons.star), Icon(Icons.star), Icon(Icons.star) ] 
      ), 
    )
  ); 
  ```

## 5. Container(), SizedBox()의 파라미터, Align()
Container() vs SizedBox() : width, height 파라미터만 필요하면 Container() 대신 SizedBox()을 써주어 가볍게 사용한다.

Container() margin, padding
  - Row(), Column()에는 여백을 줄 수 없기 때문에 꼭 Container()을 써서 여백을 주어야 한다.
  ```bash
  margin: EdgeInsets.all(30), 
  padding: EdgeInsets.fromLTRB(10, 20, 30, 40), // 자주 쓰이니까 외우는 건 어떨까?
  ```

Container() decoration
  - color, shape, boxShadow, gradient, image, borderRadius 등 여러가지 스타일을 추가 하고 싶으면 decoration()을 써준다.
  ```bash
  Container(
    decoration : BoxDecoration(
      border : Border.all(color : Colors.black)
    )
  ) 
  ```
  
Align()
  - Center() 정렬처럼 특정 위치의 정렬을 하고 싶다면 Align()을 써준다.
  ```bash
  Align(
    alignment : Alignment.bottomLeft,
    child : Container( width : 50, height : 50, color : Colors.blue )
  )
  ```
  - 만약 박스의 폭을 full로 하고 싶다면 `Container( width : double.infinity, height : 50 )`