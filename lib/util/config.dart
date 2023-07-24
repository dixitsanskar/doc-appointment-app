import 'package:flutter/material.dart';

//Width and hieght initialization
class Config {
  static MediaQueryData? mediaQueryData;
  // MediaQueryData.size property contains
  // the width and height of the current window.

  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    // MediaQuery.of function
    // to obtain the size of the current window
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get heightSize {
    return screenHeight;
  }

  static get widthSize {
    return screenWidth;
  }

  //spacing height
  static const spaceSmall = SizedBox(
    height: 25,
  );
  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );
  //textform field border
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Color(0xFF3F51B5),
    ),
  );
  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );

  static const primaryColor = Colors.indigo;
}
