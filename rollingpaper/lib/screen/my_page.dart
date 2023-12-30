import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/assets/elevatedButton_style.dart';
import 'package:rollingpaper/component/appbar.dart';
import 'package:rollingpaper/screen/home_page.dart';
import 'package:rollingpaper/screen/rolling_paper.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("My Messages",
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
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: myElevatedButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RollingPaper(
                          msgType: "Received",
                        ),
                      ),
                    );
                  },
                  child: Container(
                      child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Received Message",
                          style: TextStyle(
                              color: Color(darkGreyColor), fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(basicGreyColor),
                        )
                      ],
                    ),
                  )),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    style: myElevatedButtonStyle(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RollingPaper(
                            msgType: "Sended",
                          ),
                        ),
                      );
                    },
                    child: Container(
                        child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sended Message",
                            style: TextStyle(
                                color: Color(darkGreyColor), fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(basicGreyColor),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
