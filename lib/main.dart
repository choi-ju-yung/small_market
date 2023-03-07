import 'package:second_active/LoginSignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:second_active/loading.dart';
import 'package:second_active/error.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:second_active/FirstScreen.dart';
import 'package:second_active/LoginSignupScreen.dart';
import 'package:second_active/menu/MapScreen.dart';
import 'package:second_active/menu/map.dart';
import 'package:second_active/ChatScreen.dart';
import 'package:second_active/menu/home.dart';
import 'package:second_active/menu/menu_bar.dart';
import 'package:second_active/menu/my_page.dart';

import 'menu/detail.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: loading()); // 초기 로딩 시 Splash Screen
        } else if (snapshot.hasError) {
          return MaterialApp(home: error()); // 초기 로딩 에러 시 Error Screen
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter',
            theme: ThemeData(
                primarySwatch: Colors.blue
            ),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot){
                if(snapshot.hasData){  // 로그인 토큰을 갖고있으면 다른페이지로 이동
                  //return home();  // 로그인 성공, 회원가입 성공하면 이 페이지로 이동
                  return menu_bar();
                }
                return LoginSignupScreen(); // 갖고있지 않으면 로그인창으로 이동
              },
            ), // 로딩 완료 시 Home Screen

            routes: {
              'signup' : (context) => LoginSignupScreen(),
              '/second' : (context) => Map(),
            },
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();


  Future<Widget?> initialize(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 2000));  // 2초 딜레이
    // return LoginSignupScreen(); // 초기 로딩 완료 시 띄울 앱 첫

  }
}