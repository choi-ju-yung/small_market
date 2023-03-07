import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {


  final List<String> _textList = [
    '',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n'
    '우리 동네 소형마트 찾기 어플리케이션이 드디어 정식으로 오픈을 하게 되었습니다!!.\n\n더 나은 서비스를 위해서 열심히 노력하겠습니다. 많은 관심 부탁드리겠습니다.',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n'
    '우동(소) 어플리케이션 사용시 오류가 발생하는 부분을 찾아서 문의 주실 경우 소정의 답례로 문화상품권 10000원을 제공하겠습니다. 많은 관심 부탁드립니다.',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n간단한 매뉴얼로는 밑에 설명과 같이 이용만 하시면 쉽게 사용할 수 있습니다!!\n\n'
    '로그인 or 회원가입 -> 위치 조회 -> 근처 마트 찾기',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n'
    '이벤트 경품은 다음과 같습니다.\n(1)등 : 신세게 상품권 10만원\n(2)등 : 신세게 상품권 5만원\n(3)등 : 신세게 상품권 1만원'
    '\n\n1등 : bog***@naver.com\n2등:poq*****@nate.com\n3등:adjowq***@daum.com\n\n고객님들께 더 좋은 서비스를 제공하는 우동(소)가 되겠습니다.\n\n 감사합니다.',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n 더 나은 고객상담 서비스 제공을 위해 고객센터 시스템을 일시 점검할 예정입니다.\n\n'
    '아래와 같이 우동(소) 고객센터 서비스가 일시 중단되오니\n서비스 이용에 참고하시기 바랍니다.\n\n'
    '* 2022년 11월 12일(토) 새벽 04:00 ~ 07:00(약 3시간)\n\n* 작업 영향 : 우동(소) 고객센터 서비스 중단\n\n* 점검 소요 시간은 작업 상황에 따라 변경될 수 있습니다.\n\n'
    '점검 시간에도 고객센터 기능을 제외한 모든 기능들은 사용 가능하니, 이용에 참고 부탁드립니다.\n\n고객님들께 더 좋은 서비스를 제공하는 우동(소)가 되겠습니다.\n\n감사합니다.',
    '안녕하세요. 우동(소)입니다.\n\n항상 저희 우동(소)를 이용해주시는 고객 여러분께 깊이 감사 드립니다.\n\n'
        '이벤트 경품은 다음과 같습니다.\n(1)등 : 문화 상품권 10만원\n(2)등 : 문화 상품권 5만원\n(3)등 : 문화 상품권 1만원'
        '\n\n1등 : ad123***@naver.com\n2등:aa234*****@nate.com\n3등:pig***@daum.com\n\n고객님들께 더 좋은 서비스를 제공하는 우동(소)가 되겠습니다.\n\n 감사합니다.'
  ];
  int idx = 0;

  Widget _line(){
    return SizedBox(
      width: 380.0,
      height: 20.0,
      child: Divider(
        color: Colors.black26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,  // 뒤로가기 아이콘 색상 변경
        ),
        title: Text("공지사항",
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // idx ^= 0x01;
                        idx = 6;
                      });
                    },
                    child: Text(
                      "우동(소) 추천인 이벤트 당첨자 안내",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),

                  _line(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        // idx ^= 0x01;
                        idx = 5;
                      });
                    },
                    child: Text(
                      "시스템 점검에 따른 고객상담 서비스\n이용 제한 안내",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),

                  _line(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        // idx ^= 0x01;
                        idx = 4;
                      });
                    },
                    child: Text(
                      "친구야 같이 장보자 이벤트 당첨 안내",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),

                  _line(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        // idx ^= 0x01;
                        idx = 3;
                      });
                    },
                    child: Text(
                      "소형마켓 어플리케이션 이용법 꿀팁",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),

                  _line(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        idx = 2;
                      });
                    },
                    child: Text(
                      "버그를 찾아라!!",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),

                  _line(),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        idx = 1;
                      });
                    },
                    child: Text(
                      "우동(소) 어플리케이션 정식 오픈!!",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                          color: Colors.teal.shade900),
                    ),
                  ),
                ],
              ),

              _line(),

                  SizedBox(
                    height: 150,
                  ),

                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Container(
                         child: Card(
                              shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0, //그림자 깊이
                              child: Text(_textList[idx],
                              style: TextStyle(
                                fontFamily: 'Sources Sans Pro',
                                fontSize: 15.0,
                                color: Colors.black,
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
