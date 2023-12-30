import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/component/appbar.dart';
import 'package:rollingpaper/screen/home_page.dart';

class WritingMsg extends StatelessWidget {
  WritingMsg({super.key});

  final writingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(context, titleText: "Writing Message"),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 10,
                    controller: writingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Write Message'),
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
                      child: Text('Send!',
                          style: TextStyle(
                              fontSize: 25, color: Colors.grey.shade700)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
