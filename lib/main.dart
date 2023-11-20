import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      print(contacts[0].familyName);
      print(contacts[0].givenName);
      print(contacts[0].displayName);

    //   연락처 추가 new Contact();를 Contact();로 나타낼 수 있다.
    //   var newPreson = Contact();
    //   newPreson.givenName = '민수';
    //   newPreson.familyName = '김';
    //   await ContactsService.addContact(newPreson);


    //   dart는 타입을 잘 지켜야한다.
    //   타입 변경은 항상 에러를 잡아준다.
      setState(() {
        name = contacts;
      });

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }

  @override
  void initState(){
    super.initState();
    getPermission();  // 접속하자마자 로드되는 것(요즘은 처음부터 동의, 거절을 구하는건 비추)
  }

  var total = 3;
  var cnt = 1;
  // List<dynamic> type
  var name = [];
  // List<Contact> name = [];
  var like = [0,0,0];

  addName(newName){
    setState(() {
      name.add(newName);
    });
  }

  addOne(){
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // context 는 부모요소가 누군지 알려줌(족보같은 개념!!)
    return Scaffold(
        appBar: AppBar(
          title: Text(total.toString()), actions: [
            IconButton(onPressed: (){
              getPermission();
            }, icon: Icon(Icons.contacts))
        ],
        ),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: ( context , i ){
            print(i);
            return ListTile(
              leading: Image.asset('profile.png'),
              title: Text(name[i].givenName),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(),
        // 전구로 wrap with builder 만들면, context를 생성해준다
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(addName : addName);
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

// class BottomAppBar extends StatelessWidget {
//   const BottomAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox(
//         height: 50,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Icon(Icons.phone),
//             Icon(Icons.message),
//             Icon(Icons.contact_page),
//           ],
//         ),
//     );
//   }
// }

// 부모 => 자식 state 전송
// 1, 보내고 2. 등록하고 3. 쓴다.

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addName}) : super(key: key);
  // final을 쓰면 var과 같은 역할을 하지만 수정을 할 수 없다!!
  final addName;
  var inputData = TextEditingController();
  var inputData2 = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(onChanged: (text){ inputData2 = text; },),
            TextButton( child: Text('완료'), onPressed:(){
              addName(inputData2);
            } ),
            TextButton(
                child: Text('취소'),
                onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  }
}