// button_styles.dart

import 'package:flutter/material.dart';
import 'package:rollingpaper/assets/constants.dart';

ButtonStyle myElevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    backgroundColor: const Color(basicYellowColor),
    //specify the button's disabled text, icon, and fill color
    shadowColor:
        const Color(basicGreyColor), //specify the button's elevation color
    elevation: 4.0, //buttons Material shadow//set border for the button
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            20.0)), // set the buttons shape. Make its birders rounded etc
  );
}
