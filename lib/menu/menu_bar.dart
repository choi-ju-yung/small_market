import 'package:flutter/material.dart';
import 'package:second_active/ChatScreen.dart';
import 'package:second_active/menu/map.dart';
import 'package:second_active/menu/my_page.dart';
import 'package:second_active/menu/regular_mart.dart';
import 'package:second_active/menu/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class menu_bar extends StatefulWidget {
  const menu_bar({Key? key}) : super(key: key);

  @override
  State<menu_bar> createState() => _menu_barState();
}

class _menu_barState extends State<menu_bar> {

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    home(),
    regular_mart(),
    Map(),
    my_page(),
    // ChatScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,  //Bar의 배경색
        selectedItemColor: Colors.greenAccent,  //선택된 아이템의 색상
        unselectedItemColor: Colors.white.withOpacity(.60),  //선택 안된 아이템의 색상
        selectedFontSize: 14,  // 선택된 아이템의 폰트사이즈
        unselectedFontSize: 14,  // 선택 안된 아이템의 폰트사이즈
        onTap: (int index) {  //bottomNavigationBar 클릭 시 호출
          setState(() {  //setState()를 추가하여 인덱스를 누를때마다 빌드를 다시함
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '단골마트',
            icon: Icon(Icons.star),
          ),
          BottomNavigationBarItem(
            label: '마트찾기',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '마이페이지',
            icon: Icon(Icons.people),
          ),
          // BottomNavigationBarItem(
          //   label: '채팅하기',
          //   icon: Icon(Icons.chat),
          // ),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
