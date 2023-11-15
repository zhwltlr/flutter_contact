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


## 6. Typography & Layout
Text() 안에 style 파라미터로 텍스트의 스타일을 설정한다.
```bash
Text( '글자임', 
  style : TextStyle( color : Colors.red )  // backgroundColor, fontSize, fontWeight, fontFamily, letterSpacing
)
```

색 스타일 지정
```bash
color : Colors.red, 
color : Color.fromRGBO(20,130,50,0.8), 
color : Color(0xffffffff),
```

Button은 3가지 종류로 나뉜다. `onPressed(){}`로 클릭 핸들링이 가능하다.
```bash
TextButton( child: Text('버튼임'), onPressed: (){} )
ElevatedButton( child: Text('버튼임'), onPressed: (){} )
IconButton( icon: Icon(), onPressed: (){} )
```

AppBar() 스타일 적용하기
```bash
AppBar(
  title : Text('앱제목'),
  leading : Icon(Icons.star),
  actions : [ Icon(Icons.star), Icon(Icons.star) ]
)
```

## 7. Expanded & Flexible

Flexible() : width를 %로 나타내고 싶을때 사용한다.
```bash
Row(
  children : [
    Flexible( child: Container(color : Colors.blue), flex : 1 ),
    Flexible( child: Container(Color : Colors.green), flex : 2 )
  ]
)
```
  - Row() 안의 Container()를 Flexible()로 감싼다.
  - flex는 이 박스가 얼마나 가로폭을 차지할지 결정하는 "배수"
  - 1과 2를 써놓으면 1대 2만큼 차지하는 것

Expanded() : 하나의 박스만 가로폭을 채우고 싶을 때 사용
```bash
Row(
  children : [
    Expanded( child: Container(color : Colors.blue), flex : 1 ),
    Container(Color : Colors.green, width : 100),
  ]
)
```
  - Expanded()가 적용된 박스는 Container() 100만큼의 너비를 제외하고 꽉 채우게 된다.

## 8. Custom Widget & ListView
Custom Widget
- 커스텀 위젯은 class로 만든다. (`stless`로 생성가능)
- extends는 미리 만들어진 class 복사하는 것
- StatelessWidget : 완성품
- override : 다른 class 안에도 build(){} 가 존재하기 때문에 다른 class의 build보다 우선적으로 적용하기 위해 작성한다.
  ```bash
  class CustomWidget extends StatelessWidget {
    const CustomWidget({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Container()
    }
  } 
  ```

ListView
- Container()를 여러개 써도 스크롤이 만들어지지 않는다.
- ListView()는 스크롤을 생성해준다.
- 스크롤이 닿지 않는 곳에서는 메모리를 삭제해주기 때문에 성능을 개선할 수 있다.
- 
```bash
ListView(
  children: [
    Text('안녕'),
    Text('안녕'),
    Text('안녕'),
  ],
) 
```

## 9. ListTile
왼쪽에 이미지가 있고 오른쪽에 텍스트가 있는 레이아웃 필요할 때 사용하는 것이 좋다.
```bash
ListTile(
  leading : Image.asset('assets/profile.png'),
  title : Text('홍길동')
)
```

동적으로 만들 경우에는 ListView.builder()를 사용한다.
```bash
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, i) {
    return Text('안녕');
  }
);  
```
- itemCount: 리스트갯수
- itemBuilder: (){ return 반복할위젯 }

FloatingActionButton
- 버튼을 만들때는 child & onPressed(){}를 써야한다.
- 출력되는 값을 확인하기 위해서는 print()를 사용한다.
```bash
floatingActionButton: FloatingActionButton(
  child: Text('버튼'),
  onPressed: (){ a++; print(a); },
),
```

## 10. stateful widget
widget은 재렌더링을 해야만 변경사항이 보인다.
이를 위해 state, setState를 이용해야 한다.
```bash
// StatefulWidget
class 테스트 extends StatefulWidget {
  const 테스트({Key? key}) : super(key: key);
  @override
  _테스트State createState() => _테스트State();
}

class _테스트State extends State {

  var a = 1;  //여기 만드는 변수는 state
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}  
```
- class 안에 변수를 할당하면 state가 된다.
- state를 변경하기 위해서는 setState 함수를 이용하여 변경한다.
```bash
  MaterialApp(
  home: Scaffold(
    floatingActionButtion: FloatingActionButton(
      child : Text(a.toString()),
      onPressed: (){ 
        setState((){
          a++
        });
      }
    ),
    appBar: AppBar(),
    body: ~~~
  ),
)
```
#### 1. 데이터 변동사항이 잦을 것 같은 커스텀위젯은 전부 StatefulWidget (stful) 으로 생성
#### 2. StatefulWidget 안에서 만든 변수는 state, state 바꾸면 해당 위젯도 자동 재렌더링
#### 3. state 변경하고 싶으면 setState((){ }) 
### 이를 통해 map함수처럼 반복문을 돌리면서 데이터 바인딩을 할 수도 있다.
```bash
ListView.builder(
  itemCount: 3,
  itemBuilder: (context, i) {
    return ListTile(
      leading : Image.asset('profile.png'),
      title : Text(name[i]),
    )
  }
);  
```

## 11. Dialog & context
showDialog()
```bash
showDialog(
  context: context, 
  builder: (context){
   return Dialog(
     child: Text('AlertDialog Title'),
   );
 },
);
```
- builder는 위젯을 return 해주는 것을 써주면 된다. 
- context 는 조상 요소가 누군지 알려준다.(족보같은 개념!!)
- 조상에 대한 정보를 담고 있는 역할이다. 
- `print(context.findAncestorWidgetOfExactType<MaterialApp>());`이런식으로 확인해보면 MaterialApp이 부모요소라는 것을 알 수 있다.
- Material App이 조상요소로 있어야 Dialog()가 정상적으로 작동한다.
- 이를 위해서 다음과 같이 변경해준다.
  ```bash
  void main() {
    runApp(MaterialApp(
        home: MyApp()
      )
    );
  } 
  ```

- 혹은 전구 버튼을 눌러서 wrap with builder를 선택해주면 다음과 같이 변경된다.
- `Navigator.pop(context);` 현재 페이지 닫기
```bash
  return MaterialApp(
    home: Scaffold(
      floatingActionButton: Builder(
        builder: (jokbo1) {
          return FloatingActionButton(
            onPressed: (){
              showDialog( context: jokbo1,
                builder: (context){ return Dialog( child: Text('AlertDialog Title'), ); },
              );
            },
          );
        }
      ),  
```

## 12. 자식 위젯이 부모 위젯의 state를 사용할 때
1. 자식 요소의 파라미터에 부모의 state 값을 담는다.
  ```bash
  (MyApp 안의 DialogUI() 쓰던 곳)
  DialogUI( state : a ) 
  ```

2. 자식 위젯 정의 부분에서 어떤 파라미터가 들어오는지 설정해준다.
  ```bash
  class DialogUI extends StatelessWidget {
    DialogUI({Key? key, this.state }) : super(key: key);
    final state; 
  ```
  final은 var와 같은 역할을 하지만 수정을 할 수 없다.

3. `Text(state.toString())`등과 같이 잘 전달 받는지 확인한다.

## 13. 자식 위젯이 부모 위젯의 state를 변경할 때 
1. state 조작하는 함수를 부모 위젯에 미리 만들어둔다.
  ```bash
  class _MyAppState extends State<MyApp> {
    var name = ['김영숙', '홍길동', '피자집'];
    var total = 3;
  
    addOne() {
      setState(() {
        total++;  
      });
    }
  ```

2. 자식 위젯에 함수를 전달한다.
  ```bash
  (MyApp 안의 DialogUI() 쓰던 곳)
  DialogUI( addOne : addOne ) 
  ```

3. 자식 위젯에서 파라미터로 들어오는 함수를 등록한다.
  ```bash
  class DialogUI extends StatelessWidget {
    DialogUI({Key? key, this.addOne }) : super(key: key);
    final addOne;
  ```

4. 다음과 같이 함수를 사용하면 된다.
  ```bash
  TextButton(
    child: Text('완료'),
    onPressed: (){
      addOne();
    },
  ), 
  ```

#### Input Controll
유저가 TextField()에 입력한 값을 가져오고 싶다면, `TextEditingController()`를 사용한다.
```bash
class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne }) : super(key: key);
  final addOne;
  var inputData = TextEditingController();
```

이후, TextField() 안에 controller 파라미터를 이용하여 InputData 값을 받는다.
```bash
TextField(
  controller: inputData,
), 
```


## 14. state와 setState를 이용하여 연락처 업데이트 해보기
```bash
addName(newName){
    setState(() {
      name.add(newName);
    }); 
} 
```
- 이름을 등록할 수 있는 함수를 만든다. (setState를 포함해야 한다.)
```bash
DialogUI(addOne : addOne, addName : addName)  
```
- 자식 위젯에게 전달해준다.

```bash
class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);
  final addOne;
  final addName; 
  
TextButton(
  child: Text('완료'),
  onPressed: (){
    addName();
    addOne(inputData);
  },
), 
```
- 자식요소에서 받은 뒤 TextField의 입력값을 newName 파라미터로 넣어준다.
### 응용사항
- 완료버튼 눌러도 Dialog 닫히게 만들려면?
- 빈칸으로 완료버튼 누르면 추가안되게?
- 이름옆에 삭제버튼과 기능?
- 이름들 가나다순 정렬버튼? (sort함수 사용법을 찾아봅시다)
- 전화번호 데이터도 3개 마련해놓고 전화번호도 보여주고 싶으면?

## 15. 개발을 위한 가상의 Android 띄우기
(우분투 버전 설치 튜토리얼 확인 필요)

---

## 16. request permission from user
1. 유저에게 요청할 수 있는 외부 패키지 파일을 `pubspec.yaml` 파일에 기록하고 `pub get` 실행한다.
  ```bash
  dependencies:
    flutter:
      sdk: flutter
    permission_handler: ^8.3.0 
  ```
2.`main.dart`에서 import 해준다.
  ```bash
  import 'package:permission_handler/permission_handler.dart';
  ```

3. android/gradle.properties에 다음 사항을 확인한다.
  ```bash
  android.useAndroidX=true
  android.enableJetifier=true 
  ```

4. `android/app/src/main/AndroidManifest.xml` 파일에 다음 내용을 넣어 유저의 연락처에 read, write 권한을 요청한다.
  ```bash
  <manifest>
      <uses-permission android:name="android.permission.READ_CONTACTS"/>
      <uses-permission android:name="android.permission.WRITE_CONTACTS"/>
     <application> 
  ```
5. `main.dart`에 권한 요청을 하는 함수를 작성한다.
  ```bash
  getPermission() async {
      var status = await Permission.contacts.status;
      if (status.isGranted) {
        print('allow');
      } else if (status.isDenied) {
        print('deny');
        Permission.contacts.request();
      }
  }  
  ```
6. 권한 요청을 위한 Button을 위치한 후, `onPressed(){}`에서 호출한다.
  ```bash
  AppBar(
    title : Text('앱제목'),
    actions : [
      IconButton(onPressed: (){ getPermission(); }, icon : Icon(Icons.contacts))
    ]
  )
  ```