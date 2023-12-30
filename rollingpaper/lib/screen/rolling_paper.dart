import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/component/received_msg.dart';
import 'package:rollingpaper/component/sended_msg.dart';
import 'package:rollingpaper/screen/home_page.dart';
import 'package:rollingpaper/screen/writing_msg.dart';

class RollingPaper extends StatelessWidget {
  final String msgType;
  const RollingPaper({super.key, required this.msgType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Name's\nRolling Paper",
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
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    100,
                    (index) {
                      return msgType == "Received"
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ReceivedMsg(userName: "userName"))
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SendedMsg(userName: "userName"));
                    },
                  ),
                ),
              ),
              msgType == "Received"
                  ? Container(
                      margin: const EdgeInsets.all(12),
                      alignment: const Alignment(1, 1),
                      child: Material(
                        shape: const CircleBorder(side: BorderSide.none),
                        elevation: 15,
                        child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WritingMsg()),
                                  );
                                },
                                icon: const Icon(Icons.create))),
                      ),
                    )
                  : Container()
            ]),
          ),
        ],
      ),
    ));
  }
}
