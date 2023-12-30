import 'package:flutter/material.dart';
import 'package:rollingpaper/component/appbar.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/screen/home_page.dart';

class RollingPaperDetail extends StatelessWidget {
  const RollingPaperDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("From. Name",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Color(darkGreyColor))),
              IconButton(
                icon: const Icon(Icons.home,
                    size: 40, color: Color(basicBlueColor)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: const Text("메시지 어쩌구 저쩌구", style: TextStyle(fontSize: 25)),
          ),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: const Color(basicBlueColor)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Color(darkGreyColor)))
        ],
      ),
    ));
  }
}
