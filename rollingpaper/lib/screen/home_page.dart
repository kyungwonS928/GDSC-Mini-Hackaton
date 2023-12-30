import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/elevatedButton_style.dart';
import 'package:rollingpaper/screen/my_page.dart';
import 'package:rollingpaper/screen/user_list.dart';
import 'dart:convert'; // JSON Encode, Decode를 위한 패키지
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rollingpaper/assets/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';

  logout() async {
    await storage.delete(key: 'login');
    Navigator.pushNamed(context, '/');
  }

  // checkUserState() async {
  //   userInfo = await storage.read(key: 'login');
  //   if (userInfo == null) {
  //     print('로그인 페이지로 이동');
  //     Navigator.pushNamed(context, '/'); // 로그인 페이지로 이동
  //   } else {
  //     print('로그인 중');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   // 비동기로 flutter secure storage 정보를 불러오는 작업
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     checkUserState();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(basicGreyColor)),
            ),
            Container(
              width: 300,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/hub_logo.png'), // 이미지 파일 경로
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 40),
      SizedBox(
        height: 520,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: 300,
              child: ElevatedButton(
                style: myElevatedButtonStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserList()));
                },
                child: const Text("Rolling Paper",
                    style:
                        TextStyle(fontSize: 35, color: Color(darkBlueColor))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: 300,
              child: ElevatedButton(
                style: myElevatedButtonStyle(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyPage()));
                },
                child: const Text("My Page",
                    style:
                        TextStyle(fontSize: 35, color: Color(darkBlueColor))),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 70),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: const Alignment(1, 1),
          child: IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
      )
    ]));
  }
}
