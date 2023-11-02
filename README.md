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

## Widget 설정
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