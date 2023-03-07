import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:second_active/menu/detail.dart';
import 'package:second_active/menu/repository/contents_repository.dart';



class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final _authentication = FirebaseAuth.instance;
  var isSelected = false;
  var icon = Icons.favorite_border;

  var currentLocation;
  late ContentsRepository contentsRepository;
  final Map<String, String> locationTypeToString = {  // 아이템 값의 인덱스에따라 동 바뀜
    "안양" : "안양동",
    "비산" : "비산동",
    "박달" : "박달동",
  };

  @override
  void initState(){
    super.initState();

    currentLocation = "안양";
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    contentsRepository = ContentsRepository();
  }

  _loadContents(){
     return contentsRepository.loadContentsFromLocation(currentLocation);
  }

  Widget _bodyWidget(){
    return FutureBuilder(
        future: _loadContents(),
        builder: (BuildContext context, dynamic snapshot){
          List<Map<String, String>> datas = snapshot.data;
          if(snapshot.connectionState != ConnectionState.done) // 지역바꿀때 딜레이를 로딩중으로 순화함
            {
              return Center(child: CircularProgressIndicator());
            }

          if(snapshot.hasError){
            return Center(child: Text("데이터 오류"));
          }

          return ListView.separated(
                  itemBuilder: (BuildContext _context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                          return DetailContentView(data: datas[index],);
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Hero( // 화면전환 애니메이션 효과
                                tag: datas[index]["cid"].toString(), //  tag라는 항목을 서로 이동할 페이지 간 동일하게 작성
                                child: Image.asset(
                                  datas[index]["image"].toString(),
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            Container(
                              child: Row(
                                children: [
                                  Text(datas[index]["title"].toString(),
                                  style: TextStyle(
                                    fontSize: 20
                                    ),
                                  ),

                                  // IconButton(
                                  //   icon: Icon(icon),
                                  //   color: Colors.red,
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       isSelected = !isSelected; icon = isSelected ? Icons.favorite : Icons.favorite_border;
                                  //     });
                                  //   },
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                itemCount: 7,
                  separatorBuilder: (BuildContext _context, int index)
                  {
                    return Container(height: 1, color: Colors.black);
                  },
              );
        },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: GestureDetector(
            onTap: (){}, // 앱바에있는 문구 선택하면 실행되는 함수
            child: PopupMenuButton<String>(  // 앱바 위에 동 바꾸는 위젯
              offset: Offset(0,25),
              shape: ShapeBorder.lerp(   // 앱바 위에 동 바꾸는 위젯 모양 변경
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  1),
              onSelected: (String where){
                setState(() {
                  currentLocation = where;
                });
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(value: "안양", child: Text("안양동")),
                  PopupMenuItem(value: "비산", child: Text("비산동")),
                  PopupMenuItem(value: "박달", child: Text("박달동")),
                ];
              },
              child: Row(
                children: [
                  Text(locationTypeToString[currentLocation].toString(),
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(Icons.arrow_drop_down_circle,
                      color: Colors.black,
                      size: 30
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: (){
                          _authentication.signOut();
                          // Navigator.pop(context);
                        },
                        label: Text("로그아웃",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                        icon: Icon(Icons.exit_to_app_sharp,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),


      body: _bodyWidget(),

    );
  }
}
