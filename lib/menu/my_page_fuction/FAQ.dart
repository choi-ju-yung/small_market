import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final key = GlobalKey<ScaffoldState>();
  bool isVisible0 = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,  // 뒤로가기 아이콘 색상 변경
        ),
        title: Text("FAQ",
            style: TextStyle(
                color: Colors.black
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(  // 스크롤바 내려가게 하며 공간 확장 기능을함
        child: SafeArea(
          child: Column(
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("회원가입은 어떻게 하나요?",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                    isVisible0 == false
                        ? Icon(Icons.arrow_drop_down, color: Colors.black,)
                        : Icon(Icons.arrow_drop_up, color: Colors.black,),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isVisible0 = !isVisible0;
                  });
                },
              ),


              Visibility(
                visible: isVisible0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder( //모서리를 둥글게 하기 위해 사용
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0, //그림자 깊이
                      child: Text('우선 회원가입 화면에서 이름, 이메일, 비밀번호 순으로 입력합니다!\n\n이름은 두글자 이상, 비밀번호는 7자 이상으로 입력 바랍니다!\n\n'
                          '항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.',
                        style: TextStyle(
                          fontFamily: 'Sources Sans Pro',
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("포인트는 어디에 사용하나요?",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                    isVisible1 == false
                        ? Icon(Icons.arrow_drop_down, color: Colors.black,)
                        : Icon(Icons.arrow_drop_up, color: Colors.black,),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isVisible1 = !isVisible1;
                  });
                },
              ),

              Visibility(
                visible: isVisible1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder( //모서리를 둥글게 하기 위해 사용
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0, //그림자 깊이
                      child: Text( '포인트는 일부 마트에서 현금과 같이 사용할 수 있으며, 모든 마트에서 사용할 수 없다는 점 주의 바랍니다!!\n\n'
                          '항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.',
                        style: TextStyle(
                          fontFamily: 'Sources Sans Pro',
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("단골마트 지정은 어떻게 하나요?",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                    isVisible2 == false
                        ? Icon(Icons.arrow_drop_down, color: Colors.black,)
                        : Icon(Icons.arrow_drop_up, color: Colors.black,),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isVisible2 = !isVisible2;
                  });
                },
              ),

              Visibility(
                visible: isVisible2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder( //모서리를 둥글게 하기 위해 사용
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0, //그림자 깊이
                      child: Text( '홈 화면에서 각 지역마다 근처 마트 정보가 있습니다.\n\n그 옆에 단골마트 표시인 하트를 누르면 단골마트로 지정이 되며\n\n'
                          '단골마트를 지정하신 후 밑에 단골마트 창에 들어가면 단골마트 목록들이 보입니다!!\n\n'
                          '항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.',
                        style: TextStyle(
                          fontFamily: 'Sources Sans Pro',
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("주변 마트는 어떻게 찾나요?",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                    isVisible3 == false
                        ? Icon(Icons.arrow_drop_down, color: Colors.black,)
                        : Icon(Icons.arrow_drop_up, color: Colors.black,),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isVisible3 = !isVisible3;
                  });
                },
              ),

              Visibility(
                visible: isVisible3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder( //모서리를 둥글게 하기 위해 사용
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 4.0, //그림자 깊이
                      child: Text('우선 홈 화면 상단에 지역 아이콘 버튼을 눌러서 본인 위치를 찾은 후\n\n홈 하단의 돋보기 모양인 마트찾기를 누르면 본인 위치를 중심으로 근처'
                          '소형마켓들이 마커로 표시됩니다!!\n\n* 원활한 마트 검색을 위해서 휴대폰의 위치정보를 꼭 활성화 해주세요!\n\n'
                          '항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.',
                        style: TextStyle(
                          fontFamily: 'Sources Sans Pro',
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

          ],
    ),
    ),
    ),
    );
  }
}

//                   SizedBox(
//                     width: 380.0,
//                     height: 20.0,
//                     child: Divider(
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         // idx ^= 0x01;
//                         idx = 5;
//                       });
//                     },
//                     child: Text(
//                       "시스템 점검에 따른 고객상담 서비스\n이용 제한 안내",
//                       style: TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//
//                   SizedBox(
//                     width: 380.0,
//                     height: 20.0,
//                     child: Divider(
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         // idx ^= 0x01;
//                         idx = 4;
//                       });
//                     },
//                     child: Text(
//                       "친구야 같이 장보자 이벤트 당첨 안내",
//                       style: TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//
//                   SizedBox(
//                     width: 380.0,
//                     height: 20.0,
//                     child: Divider(
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         // idx ^= 0x01;
//                         idx = 3;
//                       });
//                     },
//                     child: Text(
//                       "소형마켓 어플리케이션 이용법 꿀팁",
//                       style: TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//
//                   SizedBox(
//                     width: 380.0,
//                     height: 20.0,
//                     child: Divider(
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         idx = 2;
//                       });
//                     },
//                     child: Text(
//                       "버그를 찾아라!!",
//                       style: TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//
//                   SizedBox(
//                     width: 380.0,
//                     height: 20.0,
//                     child: Divider(
//                       color: Colors.black26,
//                     ),
//                   ),
//
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         idx = 1;
//                       });
//                     },
//                     child: Text(
//                       "우동(소) 어플리케이션 정식 오픈!!",
//                       style: TextStyle(
//                           fontFamily: 'Source Sans Pro',
//                           fontSize: 20.0,
//                           color: Colors.teal.shade900),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 380.0,
//                 height: 20.0,
//                 child: Divider(
//                   color: Colors.black26,
//                 ),
//               ),
//
//               SizedBox(
//                 height: 150,
//               ),
//
//
//
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   child: Card(
//                     shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     elevation: 4.0, //그림자 깊이
//                     child: Text(_textList[idx],
//                       style: TextStyle(
//                         fontFamily: 'Sources Sans Pro',
//                         fontSize: 15.0,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
