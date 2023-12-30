import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/assets/elevatedButton_style.dart';
import 'package:rollingpaper/screen/rolling_paper_detail.dart';

class ReceivedMsg extends StatelessWidget {
  final String userName;

  const ReceivedMsg({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: myElevatedButtonStyle(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RollingPaperDetail()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Center(
                    child: Text("메시지 미리보기 짠",
                        style: TextStyle(
                            fontSize: 18, color: Color(darkGreyColor))))),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(basicBlueColor),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("From: $userName",
                              style: const TextStyle(
                                  fontSize: 16, color: Color(darkGreyColor))),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(basicGreyColor),
                          )
                        ],
                      ),
                    )))
          ],
        ));
  }
}
