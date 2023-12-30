import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/assets/elevatedButton_style.dart';
import 'package:rollingpaper/screen/home_page.dart';
import 'package:rollingpaper/screen/rolling_paper.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("To Who?",
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: ListView.builder(
                      itemCount: 40,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Member name",
                                    style: TextStyle(
                                        color: Color(darkGreyColor),
                                        fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(basicGreyColor),
                                  )
                                ],
                              ),
                            )),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
