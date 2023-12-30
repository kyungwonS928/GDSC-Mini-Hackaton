import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';
import 'package:rollingpaper/screen/home_page.dart';

AppBar MyAppBar(BuildContext context, {String? titleText}) {
  return AppBar(
    toolbarHeight: 70,
    leadingWidth: 70,
    leading: Row(
      children: [
        SizedBox(
          width: 30,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );
}
