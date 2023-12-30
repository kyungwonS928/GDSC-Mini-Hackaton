import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/screen/home_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:rollingpaper/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();

  final pwController = TextEditingController();

  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    // 데이터가 없을때는 null을 반환
    userInfo = await storage.read(key: 'login');

    // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.
    if (userInfo != null) {
      Navigator.pushNamed(context, '/homePage');
    } else {
      print('로그인이 필요합니다');
    }
  }

  loginAction(accountName, password) async {
    try {
      var dio = Dio();
      var param = {'account_name': '$accountName', 'password': '$password'};

      Response response = await dio.post('로그인 API URL', data: param);

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.data['user_id'].toString());
        // 직렬화를 이용하여 데이터를 입출력하기 위해 model.dart에 Login 정의 참고
        var val = jsonEncode(User('$accountName', '$password', '$jsonBody'));

        await storage.write(
          key: 'login',
          value: val,
        );
        print('접속 성공!');
        return true;
      } else {
        print('error');
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'ID'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: pwController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
              ),
              const SizedBox(height: 40),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(basicBlueColor)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      if (await loginAction(
                              idController.text, pwController.text) ==
                          true) {
                        Navigator.pushNamed(context, '/homepage');
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
