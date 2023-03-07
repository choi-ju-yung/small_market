import 'package:second_active/ChatScreen.dart';
import 'package:second_active/FirstScreen.dart';
import 'package:second_active/menu/map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance; // 사용자의 등록과 인증에 사용
  bool isSignupScreen = true;   // 버튼을 누를 때마다 다른 문구를 출력하기 위해서 플래그 사용
  bool showSpinner = false;  // 로그인, 회원가입 버튼 누를때 로딩중임을 표시하는 것
  final _formkey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation(){ // 이 메소드를 통해서 모든 validator을 작동 가능
    final isValid = _formkey.currentState!.validate(); // 폼이 유효한지 아닌지 체크 가능
    if(isValid){
      _formkey.currentState!.save();
    }  // save 메소드가 호출되면 폼 전체의 state 값을 저장하게 되며 모든 텍스트폼 필드가 갖고있는 onSaved 메소드를 작동시킴
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus(); // 빈곳 눌렀을 때 키보드 창 사라지게 되는 기능
          },
          child: Stack(  // 위젯을 층층이 쌓기 위해서 스택 위젯을 사용함
            children: [
              Positioned( // 상 하 좌 우 (위젯을 설정 할 수 있음)
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                         image: AssetImage('assets/image/카트1.png'), fit: BoxFit.fill),
                  ),  // BoxFit.fill -> 상단에 그림 잘리는거 방지
                  child: Container(
                    padding: EdgeInsets.only(top: 210, left: 30),  // 글자 위치 조절 가능
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(  // RichText -> 다양한 스타일이 혼합된 텍스트를 쓰고 싶을 때 사용하는 위젯
                          text:
                              TextSpan( // RichText의 자식위젯으로 TextSpan 위젯이 있다.
                                text: isSignupScreen ? '회원가입' : '로그인',  // 플래그로 버튼마다 문구가 다르게 나옴
                                style: TextStyle(
                                  letterSpacing: 1.0, // 글자간격
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              //까지가 배경
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),  // 애니메이션 효과 딜레이 시간
                curve: Curves.easeIn,  // 애니메이션 효과 종류
                top: 250,  // 하얀 박스 높이 조절 가능
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: EdgeInsets.all(20.0),
                  height: isSignupScreen ? 280.0 : 250.0,
                  width: MediaQuery.of(context).size.width - 40, // 각 기기마다 실제 너비값을 구할 수 있음 (화면이 가로 세로 바뀌여도 여백 일정)
                  margin: EdgeInsets.symmetric(horizontal: 20.0), // 좌우 여백을 20픽셀씩
                  decoration: BoxDecoration(  // 박스 위젯
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0), // 모서리 둥글기 효과
                    boxShadow: [
                      BoxShadow(  // 박스 위젯 안에 그림자 효과 주기
                          color: Colors.black.withOpacity(0.3), // 투명도 0.3
                          blurRadius: 15,
                          spreadRadius: 5
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row( // 로그인과 회원가입 문구들은 가로로 배치되어야함
                          mainAxisAlignment: MainAxisAlignment.spaceAround, // 같은 간격만큼 공간을 두고 정렬
                          children: [
                            GestureDetector( // 사용자의 동작을 감지하는 위젯
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;  // 사용자가 로그인 버튼을 선택했을 때
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen  // 로그인 버튼이 선택되었으면 파란색으로 색칠하고 되어있지 않는 부분은 회색으로 색칠
                                            ? Colors.blue
                                            : Colors.grey
                                    ),
                                  ),
                                  if (!isSignupScreen) // 로그인이 선택됬을 때에만 주황 밑줄 추가
                                    Container(
                                      margin: EdgeInsets.only(top: 3), // 밑줄기능
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen // 회원가입창일 때 색깔 파란색으로
                                            ? Colors.blue
                                            : Colors.grey),
                                  ),
                                  if (isSignupScreen) // 회원가입 선택했을 때 주황밑줄 그음
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if(isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              //회원가입
                              key: _formkey,
                              child: Column(
                                children: [
                                  //이름
                                  TextFormField(
                                    key: ValueKey(1), // 키 값 1 (각 창마다 입력할 때 엉퀴는걸 방지하기 위해서 정해줌)
                                    validator: (value){ // validator 사용자 입력 값 검증 위젯
                                      if(value!.isEmpty || value.length < 2){ // 비어있거나 글자수가 4개 미만이면
                                        return "최소 2글자 이상을 입력하세요";
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      userName = value!;
                                    },
                                    onChanged: (value){
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon( // prefixIcon -> 텍스트 필드 앞에 아이콘을 넣어주는 기능을 함
                                          Icons.account_circle, // 계정 아이콘
                                          color: Colors.red,
                                        ),
                                        enabledBorder: OutlineInputBorder( // 둥근 원형 텍스트 필드 생성
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder( // focusedBorder -> 텍스트 필드가 선택되었을 때 원형라인이 보여지기 위한 것
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: 'User name',
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        contentPadding: EdgeInsets.all(10)  // 텍스트 필드 폭 줄이기
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  // 이메일
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress, // 이메일용 키보드 판이 나옴
                                    key: ValueKey(2), // 키 값 2
                                    validator: (value){ // validator 사용자 입력 값 검증 위젯
                                      if(value!.isEmpty || !value.contains('@')){ // 비어있거나 @가 포함되지 않으면
                                        return "유효한 이메일을 입력해주세요";
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      userEmail = value!;
                                    },
                                    onChanged: (value){
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.red,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: 'email',
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  // 패스워드
                                  TextFormField(
                                    obscureText: true, // 비밀번호 * 로 숨기기 위해서 사용
                                    key: ValueKey(3),
                                    validator: (value){ // validator 사용자 입력 값 검증 위젯
                                      if(value!.isEmpty || value.length < 7){
                                        return "패스워드가 최소 7글자 필요합니다";
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      userPassword = value!;
                                    },
                                    onChanged: (value){
                                      userPassword = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(//비밀번호 아이콘
                                          Icons.lock,
                                          color: Colors.red,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: 'password',
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        contentPadding: EdgeInsets.all(10)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if(!isSignupScreen)
                          //로그인
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form( //아이디 = 이메일
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: ValueKey(4),
                                    validator: (value){
                                      if(value!.isEmpty || !value.contains('@') ){
                                        return '이메일이 올바른지 확인하세요';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      userEmail = value!;
                                    },

                                    onChanged: (value){
                                      userEmail = value;
                                    },

                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.red,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: 'email',
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  //로그인-비밀번호
                                  TextFormField(
                                    obscureText: true,
                                    key: ValueKey(5),
                                    validator: (value){
                                      if(value!.isEmpty || value.length < 6){
                                        return '최소 7글자 이상의 비밀번호를 입력하세요';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      userPassword = value!;
                                    },
                                    onChanged: (value){
                                      userPassword = value;
                                    },

                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.red,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: 'password',
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        contentPadding: EdgeInsets.all(10)),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              //까지가 텍스트 폼 필드

              AnimatedPositioned( // 애니메이션 효과
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? 480 : 430,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: GestureDetector(
                      onTap: () async { // await 키워드를 사용한 함수는 무조건 async 함수

                        if (isSignupScreen) {  // 계정등록 버튼 눌렀을 때
                          _tryValidation(); // 유효성 검사 함수 호출
                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );

                            await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid)
                            .set({  // 파이어베이스의 데이터베이스에 user 컬렉션이 생성되있으며 문서 내에는 이메일주소와 이름이 생성됨
                              'userName' : userName,
                              'email' : userEmail
                            });

                            if (newUser.user != null) {
                              setState(() {
                                showSpinner = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                  Text("회원가입 성공!"),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() {
                              showSpinner = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                Text("이메일과 비밀번호를 다시 확인해주세요\n"
                                    "계정, 이메일, 비밀번호 부분에서 오류가 나지 않은 경우\n"
                                    "이미 등록된 계정입니다."),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        }

                        if(!isSignupScreen) {  // 로그인버튼 눌렀을 때
                          _tryValidation();
                          setState(() {
                             showSpinner = true;
                          });
                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );
                            if (newUser.user != null) {
                              setState(() {
                                showSpinner = false;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) {
                              //     return ChatScreen();
                              //   }
                              //   ),
                              // );
                            }
                          }catch(e){
                            print(e);
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        }
                      },


                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(  // 원형버튼에 그라데이션 만들기
                              colors: [Colors.orange, Colors.red],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,  // 화살표 아이콘 넣기
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //까지가 전송버튼

              // AnimatedPositioned(
              //   duration: Duration(milliseconds: 500),
              //   curve: Curves.easeIn,
              //   top: isSignupScreen ? MediaQuery.of(context).size.height - 125
              //   :MediaQuery.of(context).size.height - 165,
              //   right: 0,
              //   left: 0,
              //   child: Column(
              //     children: [
              //       Text(isSignupScreen ? 'or Signup with' : 'or Signin with'), // 로그인 창 눌렀을때는 or Signin with 나오게
              //       SizedBox(
              //         height: 10,
              //       ),
              //       TextButton.icon(
              //         onPressed: (){},
              //         style: TextButton.styleFrom(
              //             primary: Colors.white,
              //             minimumSize: Size(155, 40),
              //             shape: RoundedRectangleBorder( // 원형
              //                 borderRadius: BorderRadius.circular(20)
              //             ),
              //             backgroundColor: Colors.green
              //         ),
              //         icon: Icon(Icons.add), // + 아이콘
              //         label: Text('Google'),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}